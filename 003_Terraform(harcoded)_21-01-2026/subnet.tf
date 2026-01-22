resource "azurerm_subnet" "subnet" {
  name                 = "revision-subnet5"
  resource_group_name  = "revision-rg5"
  virtual_network_name = "revision-vnet5"
  address_prefixes     = ["10.0.1.0/24"]
}
