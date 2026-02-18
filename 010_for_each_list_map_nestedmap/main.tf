
#for_each + list
# resource "azurerm_resource_group" "example" {
#   for_each = toset(var.name)  
#   name     = each.value  #each.value/each.key
#   location = "West Europe"
# }

# variable "name" {}

# #for_each + MAP
# resource "azurerm_resource_group" "example" {
#   for_each = var.rg
#   name     = each.key  
#   location = each.value
# }

# variable "rg" {}

#for_each + nested MAP
resource "azurerm_resource_group" "example" {
  for_each = var.rgs
  name     = each.value.name
  location = each.value.location
}

variable "rgs" {}