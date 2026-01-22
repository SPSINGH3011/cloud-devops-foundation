resource "azurerm_virtual_network" "vnet" {
  name                = "revision-vnet5"
  location            = "central india"
  resource_group_name = "revision-rg5"
  address_space       = ["10.0.0.0/16"]
}
