# A data block is used to fetch information about existing resources that are already created outside your Terraform code.

# 👉 It does NOT create resources.
# 👉 It only reads existing resources.

# ✅ Azure Example: Read Existing Resource Group

# Assume the Resource Group is already created in Azure.
    # "id": "/subscriptions/c637cbf9-3250-4fc9-85ea-08b629343981/resourceGroups/rg-prod",
    # "name": "rg-prod",
    # "type": "Microsoft.Resources/resourceGroups",
    # "location": "centralindia",

# data "azurerm_resource_group" "existing_rg" {
#   name = "rg-prod"
# }

# resource "azurerm_storage_account" "sa" {
#   name                     = "prodstorage123"
#   resource_group_name      = data.azurerm_resource_group.existing_rg.name
#   location                 = data.azurerm_resource_group.existing_rg.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }
