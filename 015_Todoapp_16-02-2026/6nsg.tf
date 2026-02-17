resource "azurerm_network_security_group" "nsg" {
  depends_on          = [azurerm_resource_group.rgs]
  for_each            = var.nsg
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}


resource "azurerm_subnet_network_security_group_association" "as" {
  depends_on                = [azurerm_network_security_group.nsg, azurerm_subnet.subnet]
  for_each                  = var.nsg
  subnet_id                 = data.azurerm_subnet.data_subnet1[each.key].id
  network_security_group_id = data.azurerm_network_security_group.asg[each.key].id
}

data "azurerm_subnet" "data_subnet1" {
  depends_on           = [azurerm_virtual_network.vnet, azurerm_resource_group.rgs]
  for_each             = var.nsg
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_network_security_group" "asg" {
  depends_on          = [azurerm_resource_group.rgs, azurerm_network_security_group.nsg]
  for_each            = var.nsg
  name                = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
}
