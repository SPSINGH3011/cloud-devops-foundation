resource "azurerm_network_interface" "nic" {
  depends_on = [ azurerm_subnet.subnet , azurerm_public_ip.pip]
  name                = "revision-nic5"
  location            = "central india"
  resource_group_name = "revision-rg5"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}

resource "azurerm_network_interface" "nic1" {
  depends_on = [ azurerm_subnet.subnet2 ,azurerm_public_ip.pip1 ]
  name                = "revision-nic6"
  location            = "central india"
  resource_group_name = "revision-rg5"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip1.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  depends_on = [ azurerm_resource_group.rg , azurerm_virtual_network.vnet , azurerm_public_ip.pip ,azurerm_subnet.subnet ]
  name                = "revision-linux-machine01"
  location            = "central india"
  resource_group_name = "revision-rg5"
  size                = "Standard_D2s_v5"
  admin_username      = "adminuser"
  admin_password = "adminuser@123"
  network_interface_ids = [azurerm_network_interface.nic.id]
 disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}