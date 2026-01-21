resource "azurerm_virtual_network" "vnet" {
  name                = "revision-vnet"
  location            = "west us"
  resource_group_name = "revision-rg3"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "revision-vnet1"
  location            = "central india"
  resource_group_name = "revision-rg4"
  address_space       = ["10.0.0.0/16"]
}