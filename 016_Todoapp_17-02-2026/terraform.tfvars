resource_groups = {
  fe = {
    name     = "rg-fe"
    location = "central india"
  }
  be = {
    name     = "rg-be"
    location = "central india"
  }
}

vnets = {
  fe = {
    vnet_name           = "vnet-fe"
    location            = "central india"
    resource_group_name = "rg-fe"
    address_space       = ["10.0.0.0/16"]
  }
  be = {
    vnet_name           = "vnet-be"
    location            = "central india"
    resource_group_name = "rg-be"
    address_space       = ["10.1.0.0/16"]
  }
}

subnets = {
  fe = {
    subnet_name          = "subnet-fe"
    resource_group_name  = "rg-fe"
    virtual_network_name = "vnet-fe"
    address_prefixes     = ["10.0.1.0/24"]
  }
  be = {
    subnet_name          = "subnet-be"
    resource_group_name  = "rg-be"
    virtual_network_name = "vnet-be"
    address_prefixes     = ["10.1.1.0/24"]
  }
}

pips = {
  fe = {
    pip_name            = "pip-fe"
    location            = "central india"
    resource_group_name = "rg-fe"
  }
  be = {
    pip_name            = "pip-be"
    location            = "central india"
    resource_group_name = "rg-be"
  }
}

nsg = {
  fe = {
    nsg_name            = "nsg-fe"
    location            = "central india"
    resource_group_name = "rg-fe"
  }
  be = {
    nsg_name            = "nsg-be"
    location            = "central india"
    resource_group_name = "rg-be"
  }
}

nic = {
  fe = {
    nic_name            = "nic-fe"
    location            = "central india"
    resource_group_name = "rg-fe"
  }
  be = {
    nic_name            = "nic-be"
    location            = "central india"
    resource_group_name = "rg-be"
  }
}

vms = {
  fe = {
    vm_name             = "vm-fe"
    location            = "central india"
    resource_group_name = "rg-fe"
    vm_size             = "Standard_D2as_v5"
  }
  be = {
    vm_name             = "vm-be"
    location            = "central india"
    resource_group_name = "rg-be"
    vm_size             = "Standard_D2as_v5"
  }
  
}
