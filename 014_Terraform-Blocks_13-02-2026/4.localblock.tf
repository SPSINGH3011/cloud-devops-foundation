# locals block is used to define reusable values inside Terraform.

# It reduces duplication.

# locals {
#   location = "Central India"
#   env      = "dev"
# }

# resource "azurerm_resource_group" "rg4" {
#   name     = "rg-${local.env}"    #"rg-dev"
#   location = local.location     #"centralindia"
# }


# resource "azurerm_storage_account" "sa4" {
#     depends_on = [ azurerm_resource_group.rg4 ]
#   name                     = "prodstorage123"
#   resource_group_name      =  "rg-${local.env}"
#   location                 =  local.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }