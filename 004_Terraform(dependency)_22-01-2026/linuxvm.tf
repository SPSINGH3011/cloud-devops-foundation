resource "azurerm_resource_group" "rg" {
  name     = "depend-resources"
  location = "central india"
}

#IMPLICIT
resource "azurerm_virtual_network" "vnet" {
  name                = "depend-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

#explicit
resource "azurerm_subnet" "subnet" {
  depends_on = [ azurerm_resource_group.rg ,  azurerm_virtual_network.vnet]
  name                 = "internal"
  resource_group_name  = "depend-resources"
  virtual_network_name = "depend-network"
  address_prefixes     = ["10.0.2.0/24"]
}


#explicit
resource "azurerm_public_ip" "pip" {
  depends_on = [ azurerm_resource_group.rg ]
  name                = "adependPublicIp"
  resource_group_name = "depend-resources"
  location            = "central india"
  allocation_method   = "Static"
}


#implicit
resource "azurerm_network_interface" "nic" {
  name                = "depend-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name


  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}


#implicit
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "depend-machine"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_D2s_v5"
  admin_username      = "adminuser"
  admin_password = "adminuser@123"
  network_interface_ids = [azurerm_network_interface.nic.id]
  disable_password_authentication = false


  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }


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