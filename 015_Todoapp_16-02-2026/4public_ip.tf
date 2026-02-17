resource "azurerm_public_ip" "pip" {
  depends_on = [azurerm_resource_group.rgs]

  for_each            = var.pips
  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}
