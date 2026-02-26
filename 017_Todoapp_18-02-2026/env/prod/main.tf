module "rg" {
    source = "../../modules/1.Resource_Group"  #module rg
    resource_groups = var.resource_groups
}

module "vnet" {
    depends_on = [ module.rg ]
    source = "../../modules/2.vnet"  
     vnets= var.vnets
}

module "subnet" {
    depends_on = [ module.rg ,module.vnet ]
    source = "../../modules/3.Subnet"  
     subnets= var.subnets
}

module "public_ip" {
    depends_on = [ module.rg]
    source = "../../modules/4.Public_ip"  
     pips= var.pips
}


module "nic" {
    depends_on = [ module.rg ,module.subnet,module.public_ip]
    source = "../../modules/5.Nic"  
    nic = var.nic 
}

module "nsg" {
    depends_on = [ module.rg ,module.subnet ,module.vnet]
    source = "../../modules/6.NSG"  
    nsg = var.nsg
}

module "linux_vm" {
    depends_on = [ module.rg ,module.subnet ,module.vnet,module.nic,module.nsg,module.public_ip]
    source = "../../modules/7.Linux_VM"  
    vms = var.vms
}

module "mssql_server" {
    depends_on = [ module.rg]
    source = "../../modules/9.DB"  
    db = var.db
}

