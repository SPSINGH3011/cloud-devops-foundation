resource_groups = {
  fe = {
    name     = "prod-rg"
    location = "central india"
  }
}

vnets = {
  fe = {
    vnet_name           = "vnet-prod"
    location            = "central india"
    resource_group_name = "prod-rg"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  fe = {
    subnet_name          = "subnet-prodfe"
    resource_group_name  = "prod-rg"
    virtual_network_name = "vnet-prod"
    address_prefixes     = ["10.0.1.0/24"]
  }
  be = {
    subnet_name          = "subnet-prodbe"
    resource_group_name  = "prod-rg"
    virtual_network_name = "vnet-prod"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

pips = {
  fe = {
    pip_name            = "pip-prodfe"
    location            = "central india"
    resource_group_name = "prod-rg"
  }
  be = {
    pip_name            = "pip-prodbe"
    location            = "central india"
    resource_group_name = "prod-rg"
  }
}

nic = {
  fe = {
    nic_name             = "nic-prodfe"
    location             = "central india"
    resource_group_name  = "prod-rg"
    virtual_network_name = "vnet-prod"
    subnet_name          = "subnet-prodfe"
    pip_name             = "pip-prodfe"

  }
  be = {
    nic_name             = "nic-prodbe"
    location             = "central india"
    resource_group_name  = "prod-rg"
    virtual_network_name = "vnet-prod"
    subnet_name          = "subnet-prodbe"
    pip_name             = "pip-prodbe"
  }
}

nsg = {
  fe = {
    nsg_name             = "nsg-prodfe"
    location             = "central india"
    resource_group_name  = "prod-rg"
    virtual_network_name = "vnet-prod"
    subnet_name          = "subnet-prodfe"

  }
  be = {
    nsg_name             = "nsg-prodbe"
    location             = "central india"
    resource_group_name  = "prod-rg"
    virtual_network_name = "vnet-prod"
    subnet_name          = "subnet-prodbe"
  }
}


vms = {
  fe = {
    vm_name              = "vm-prodfe"
    location             = "central india"
    resource_group_name  = "prod-rg"
    vm_size              = "Standard_D2as_v5"
    nic_name             = "nic-prodfe"
    virtual_network_name = "vnet-prod"
    subnet_name          = "subnet-prodfe"
  }
  be = {
    vm_name              = "vm-prodbe"
    location             = "central india"
    resource_group_name  = "prod-rg"
    vm_size              = "Standard_D2as_v5"
    nic_name             = "nic-prodbe"
    virtual_network_name = "vnet-prod"
    subnet_name          = "subnet-prodbe"
  }

}

db = {
  mssql_server = {
    server_name                   = "serverprodsp"
    resource_group_name           = "prod-rg"
    location                      = "centralindia"
    version                       = "12.0"
    public_network_access_enabled = true
    administrator_login           = "serversp"
    administrator_login_password  = "satya@12345"
    minimum_tls_version           = "1.2"
    db_name                       = "proddb"
    collation                     = "SQL_Latin1_General_CP1_CI_AS"
    license_type                  = "LicenseIncluded"
    max_size_gb                   = 2
    sku_name                      = "S0"
    enclave_type                  = "VBS"
  }
}
