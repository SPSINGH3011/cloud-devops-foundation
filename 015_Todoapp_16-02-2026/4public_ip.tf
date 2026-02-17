resource "azurerm_public_ip" "pip" {
  depends_on = [ azurerm_resource_group.rgs ]
    for_each = var.pip
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method                       #"Static"
}


