resource "azurerm_network_interface" "nic" {
  name                = "revision-nic5"
  location            = "central india"
  resource_group_name = "revision-rg5"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "/subscriptions/1e4f7c75-847c-48f7-b236-218b82663529/resourceGroups/revision-rg5/providers/Microsoft.Network/virtualNetworks/revision-vnet5/subnets/revision-subnet5"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = "/subscriptions/1e4f7c75-847c-48f7-b236-218b82663529/resourceGroups/revision-rg5/providers/Microsoft.Network/publicIPAddresses/revision-PublicIp5"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
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