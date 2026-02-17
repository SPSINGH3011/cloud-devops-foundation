resource "azurerm_virtual_network" "vnet" {
  depends_on = [ azurerm_resource_group.rgs ]
  for_each = var.vnet
  name                = each.value.vnet_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       =  each.value.address_space                          #["10.0.0.0/16"]
}

