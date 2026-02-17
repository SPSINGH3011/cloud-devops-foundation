resource "azurerm_subnet" "subnet" {
  depends_on = [ azurerm_virtual_network.vnet ,azurerm_resource_group.rgs ]
  for_each = var.subnets
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes                   #["10.0.1.0/24"]
}

