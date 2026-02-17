
module "resource_group"{
   source =  "../../modules/Resource_Group" 
   rgs = var.rgs
}

module "storage_account"{
    depends_on = [ module.resource_group ]
   source =  "../../modules/Storage_account" 
   stgs = var.stgs
}


