# rgs = {
# "dev-rg3" ="west us"
# }

rgs = {
    rg1 = {
    name =  "dev-rg3"
   location="west us"
    }

    rg2 = {
   name =  "dev-rg4"
   location="west us"
    }
}


stgs = {
    stg1 = {
  name                     = "stgabc657585"
  resource_group_name      = "dev-rg4"
  location                 = "west us"
  account_tier             = "Standard"
  account_replication_type = "LRS"
    }
}