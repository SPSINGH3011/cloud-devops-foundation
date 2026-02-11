terraform {
backend "azurerm" {
    resource_group_name = "tfstate-rg"
    storage_account_name = "foodapptfstate123"
    container_name = "tfstate"
    key = "dev.tfstate"
}
}