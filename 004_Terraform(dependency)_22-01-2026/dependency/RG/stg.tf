#IMPLICIT
resource "azurerm_storage_account" "stg1" {
  name                     = "storageaccountnamegdgdg1"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

#EXPLICIT
resource "azurerm_storage_account" "stg2" {
  depends_on = [ azurerm_resource_group.example ]
  name                     = "storageaccountnamegdgdg2"
  resource_group_name      = "rg-spec"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}