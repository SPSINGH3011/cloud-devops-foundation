data "azurerm_subnet" "subnet" {
  depends_on = [ azurerm_subnet.subnet ]
  for_each             = var.subnets
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip" {
  depends_on = [ azurerm_resource_group.rgs ,azurerm_public_ip.pip]
  for_each            = var.pips
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}


data "azurerm_network_security_group" "nsg" {
  depends_on = [ azurerm_resource_group.rgs ,azurerm_network_security_group.nsg]
  for_each            = var.nsg
  name                = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
}

# resource "azurerm_subnet_network_security_group_association" "as" {

#   for_each = var.nsg

#   subnet_id                 = data.azurerm_subnet.subnet[each.key].id
#   network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
# }

data "azurerm_network_interface" "nic" {
  depends_on = [ azurerm_network_interface.nic ]
  for_each            = var.nic
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

