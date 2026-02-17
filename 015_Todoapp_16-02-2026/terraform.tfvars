rgs = {
  fe = {
    rg_name  = "todoapprg-fe"
    location = "central india"
  }

  be = {
    rg_name  = "todoapprg-be"
    location = "central india"
  }
}

vnet = {
  fe-vnet = {
    vnet_name           = "todoapp-fevnet"
    location            = "central india"
    resource_group_name = "todoapprg-fe"
    address_space       = ["10.0.0.0/16"]
  }


  be-vnet = {
    vnet_name           = "todoapp-bevnet"
    location            = "central india"
    resource_group_name = "todoapprg-be"
    address_space       = ["10.1.0.0/16"]
  }
}

subnets = {
  fe-subnet = {
    subnet_name          = "todoapp-fesubnet"
    resource_group_name  = "todoapprg-fe"
    virtual_network_name = "todoapp-fevnet"
    address_prefixes     = ["10.0.1.0/24"]
  }

  be-subnet = {
    subnet_name          = "todoapp-besubnet"
    resource_group_name  = "todoapprg-be"
    virtual_network_name = "todoapp-bevnet"
    address_prefixes     = ["10.1.1.0/24"]
  }
}

pip = {
  fe-pip = {
    pip_name            = "todoapp-fepip"
    resource_group_name = "todoapprg-fe"
    location            = "central india"
    allocation_method   = "Static"
  }

  be-pip = {
    pip_name            = "todoapp-bepip"
    resource_group_name = "todoapprg-be"
    location            = "central india"
    allocation_method   = "Static"
  }

}

nic = {
  fe-nic = {
    nic_name             = "todoapp-fenic"
    location             = "central india"
    resource_group_name  = "todoapprg-fe"
    virtual_network_name = "todoapp-fevnet"
    subnet_name          = "todoapp-fesubnet"
    pip_name             = "todoapp-fepip"
  }

  be-nic = {
    nic_name             = "todoapp-benic"
    location             = "central india"
    resource_group_name  = "todoapprg-be"
    virtual_network_name = "todoapp-bevnet"
    subnet_name          = "todoapp-besubnet"
    pip_name             = "todoapp-bepip"

  }
}

nsg = {
  fe-nsg = {
    nsg_name             = "todoapp-fensg"
    location             = "central india"
    resource_group_name  = "todoapprg-fe"
    virtual_network_name = "todoapp-fevnet"
    subnet_name          = "todoapp-fesubnet"
  }

  be-nsg = {
    nsg_name             = "todoapp-bensg"
    location             = "central india"
    resource_group_name  = "todoapprg-be"
    virtual_network_name = "todoapp-bevnet"
    subnet_name          = "todoapp-besubnet"
  }
}

vms = {

  fe-vm = {
    vm_name              = "todoapp-fe"
    location             = "central india"
    resource_group_name  = "todoapprg-fe"
    nic_name             = "todoapp-fenic"
    virtual_network_name = "todoapp-fevnet"
    subnet_name          = "todoapp-fesubnet"

  }

  be-vm = {
    vm_name              = "todoapp-be"
    location             = "central india"
    resource_group_name  = "todoapprg-be"
    nic_name             = "todoapp-benic"
    virtual_network_name = "todoapp-bevnet"
    subnet_name          = "todoapp-besubnet"
  }
}
