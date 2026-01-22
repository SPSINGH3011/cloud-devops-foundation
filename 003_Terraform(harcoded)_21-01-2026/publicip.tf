resource "azurerm_public_ip" "pip" {
  name                = "revision-PublicIp5"
  location            = "central india"
  resource_group_name = "revision-rg5"
  allocation_method   = "Static"
}
