resource "azurerm_storage_account" "storage" {
  name                     = "storageacrevoskm"
  resource_group_name      = "revision-rg2"
  location                 = "west us"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}