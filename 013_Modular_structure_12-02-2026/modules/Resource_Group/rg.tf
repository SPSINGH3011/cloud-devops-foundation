# resource "azurerm_resource_group" "rg" {
#   name     = var.name                 # "dev-rg3"
#   location = var.location             # "central india"
# }

resource "azurerm_resource_group" "rg" {
  for_each = var.rgs
  name     = each.value.name             #req argument 
  location = each.value.location         #req argument  
}

