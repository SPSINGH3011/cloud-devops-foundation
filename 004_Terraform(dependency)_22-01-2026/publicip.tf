resource "azurerm_public_ip" "pip" {
  depends_on = [ azurerm_resource_group.rg ]
  name                = "revision-PublicIp5"
  location            = "central india"
  resource_group_name = "revision-rg5"
  allocation_method   = "Static"
}

resource "azurerm_public_ip" "pip1" {
  depends_on = [ azurerm_resource_group.rg ]
  name                = "revision-PublicIp6"
  location            = "central india"
  resource_group_name = "revision-rg5"
  allocation_method   = "Static"
}