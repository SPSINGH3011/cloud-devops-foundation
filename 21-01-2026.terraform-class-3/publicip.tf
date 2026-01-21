resource "azurerm_public_ip" "pip" {
  name                = "revision-PublicIp1"
  location            = "central india"
  resource_group_name = "revision-rg4"
  allocation_method   = "Static"
}
