resource "azurerm_subnet" "subnet" {
  depends_on = [ azurerm_virtual_network.vnet ]
  name                 = "revision-subnet5"
  resource_group_name  = "revision-rg5"
  virtual_network_name = "revision-vnet5"
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  depends_on = [ azurerm_virtual_network.vnet1 ]
  name                 = "revision-subnet6"
  resource_group_name  = "revision-rg5"
  virtual_network_name = "revision-vnet6"
  address_prefixes     = ["10.0.2.0/24"]
}