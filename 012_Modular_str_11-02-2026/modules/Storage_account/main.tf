resource "azurerm_storage_account" "storage" {
  name                     = "dev1234storageacountname"
  resource_group_name      = "dev-rg3"

  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}


