resource "azurerm_virtual_network" "vnet" {
  depends_on = [ azurerm_resource_group.rg ]
  name                = "revision-vnet5"
  location            = "central india"
  resource_group_name = "revision-rg5"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_virtual_network" "vnet1" {
  depends_on = [ azurerm_resource_group.rg ]
  name                = "revision-vnet6"
  location            = "central india"
  resource_group_name = "revision-rg5"
  address_space       = ["10.0.0.0/16"]
}