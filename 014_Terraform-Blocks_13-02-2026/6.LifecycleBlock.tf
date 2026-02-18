
# Controls how Terraform handles resource creation & deletion.

# 1.prevent_destroy = true
# 2.create_before_destroy = true  ,“First create the new resource, then delete the old one.”
# If create_before_destroy = false (default)

# 👉 Terraform deletes old storage first
# 👉 Then creates new one

# true → Creates new resource before deleting old (no downtime)

# false → Deletes old resource first, then creates new (possible downtime)

# 3.ignore_changes = [tags]


# # 1. prevent_destroy = true
 
# resource "azurerm_resource_group" "rg6" {
#   name     = "critical-rg6"
#   location = "Central India"

#   lifecycle {
#     prevent_destroy = true  #false - rakhne per distroy ho jayega
#   }
# }

# Now if someone runs terraform destroy ❌
# Terraform will throw error.

# 2.create_before_destroy

# “First create the new resource, then delete the old one.”
# ❌ Without create_before_destroy (Default Behavior)

# If you change a property that forces recreation (like name), Terraform will:

# Destroy old resource

# Create new resource

# resource "azurerm_storage_account" "sa6" {
#     depends_on = [ azurerm_resource_group.rg6 ]
#   name                     = "mystoragelifec1237557" #old anme mystoragelifec12345
#   resource_group_name      = "critical-rg6"
#   location                 = "Central India"
#   account_tier             = "Standard"
#   account_replication_type = "LRS"

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# 🔁 Now Change:
# name = "mystorage67890"

# Since name forces replacement:

# With create_before_destroy = true

# 👉 Terraform creates new storage first
# 👉 Then deletes old one
# 👉 No downtime

# 3 ignore_changes
# “Ignore changes made outside Terraform for specific attributes.”

# Very common in real Azure projects.
# resource "azurerm_resource_group" "rg66" {
#   name     = "rg-dev66"
#   location = "Central India"

#   tags = {
#     environment = "dev66"
#   }

#   lifecycle {
#     ignore_changes = [tags]
#   }
# }

# DevOps team manually adds tag in Azure Portal:
# Owner = "Satya"

# With ignore_changes = [tags]

# 👉 Terraform will NOT try to remove the new tag
# 👉 No changes detected