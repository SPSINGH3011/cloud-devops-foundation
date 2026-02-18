# Moved Block (moved)
# Used when you rename or move a resource in Terraform configuration.

# It tells Terraform:
# 👉 “This resource is same, just renamed.”

# Prevents recreation.

# 👉 Without this, Terraform destroys and recreates.

# resource "azurerm_resource_group" "rg5" {
#   name     = "rg-dev5"
#   location = "centralindia"
# }
# resource "azurerm_resource_group" "rg_new" {
#   name     = "rg-dev5"
#   location = "centralindia"
# }


# moved {
#   from = azurerm_resource_group.rg5
#   to   = azurerm_resource_group.rg_new
# }
