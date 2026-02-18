resource "azurerm_subnet_network_security_group_association" "as" {
depends_on = [ azurerm_network_security_group.nsg ,azurerm_subnet.subnet]
  for_each = var.nsg

  subnet_id                 = data.azurerm_subnet.subnet[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
}
