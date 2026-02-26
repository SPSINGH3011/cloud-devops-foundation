resource_groups = {
  fe = {
    name     = "dev-fe"
    location = "central india"
  }
  be = {
    name     = "dev-be"
    location = "central india"
  }
}

vnets = {
  fe = {
    vnet_name           = "vnet-devfe"
    location            = "central india"
    resource_group_name = "dev-fe"
    address_space       = ["10.0.0.0/16"]
  }
  be = {
    vnet_name           = "vnet-devbe"
    location            = "central india"
    resource_group_name = "dev-be"
    address_space       = ["10.1.0.0/16"]
  }
}

subnets = {
  fe = {
    subnet_name          = "subnet-devfe"
    resource_group_name  = "dev-fe"
    virtual_network_name = "vnet-devfe"
    address_prefixes     = ["10.0.1.0/24"]
  }
  be = {
    subnet_name          = "subnet-devbe"
    resource_group_name  = "dev-be"
    virtual_network_name = "vnet-devbe"
    address_prefixes     = ["10.1.1.0/24"]
  }
}

pips = {
  fe = {
    pip_name            = "pip-devfe"
    location            = "central india"
    resource_group_name = "dev-fe"
  }
  be = {
    pip_name            = "pip-devbe"
    location            = "central india"
    resource_group_name = "dev-be"
  }
}

nic = {
  fe = {
    nic_name             = "nic-devfe"
    location             = "central india"
    resource_group_name  = "dev-fe"
    virtual_network_name = "vnet-devfe"
    subnet_name          = "subnet-devfe"
    pip_name             = "pip-devfe"

  }
  be = {
    nic_name             = "nic-devbe"
    location             = "central india"
    resource_group_name  = "dev-be"
    virtual_network_name = "vnet-devbe"
    subnet_name          = "subnet-devbe"
    pip_name             = "pip-devbe"
  }
}

nsg = {
  fe = {
    nsg_name             = "nsg-devfe"
    location             = "central india"
    resource_group_name  = "dev-fe"
    virtual_network_name = "vnet-devfe"
    subnet_name          = "subnet-devfe"

  }
  be = {
    nsg_name             = "nsg-devbe"
    location             = "central india"
    resource_group_name  = "dev-be"
    virtual_network_name = "vnet-devbe"
    subnet_name          = "subnet-devbe"
  }
}


vms = {
  fe = {
    vm_name              = "vm-devfe"
    location             = "central india"
    resource_group_name  = "dev-fe"
    vm_size              = "Standard_D2as_v5"
    nic_name             = "nic-devfe"
    virtual_network_name = "vnet-devfe"
    subnet_name          = "subnet-devfe"
  }
  be = {
    vm_name              = "vm-devbe"
    location             = "central india"
    resource_group_name  = "dev-be"
    vm_size              = "Standard_D2as_v5"
    nic_name             = "nic-devbe"
    virtual_network_name = "vnet-devbe"
    subnet_name          = "subnet-devbe"
  }

}
