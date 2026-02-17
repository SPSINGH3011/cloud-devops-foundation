
rgs = {
    rg1 = {
    name =  "prod-rg3"
   location="west us"
    }

    rg2 = {
   name =  "prod-rg4"
   location="west us"
    }
}


stgs = {
    stg1 = {
  name                     = "stgaprodbc657585"
  resource_group_name      = "prod-rg4"
  location                 = "west us"
  account_tier             = "Standard"
  account_replication_type = "ZRS"
    }
}