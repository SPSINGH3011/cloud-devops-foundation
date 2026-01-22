resource "azurerm_subnet" "subnet" {
  name                 = "revision-subnet1"
  resource_group_name  = "revision-rg4"
  virtual_network_name = "revision-vnet1"
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "revision-subnet2"
  resource_group_name  = "revision-rg4"
  virtual_network_name = "revision-vnet1"
  address_prefixes     = ["10.0.2.0/24"]
}