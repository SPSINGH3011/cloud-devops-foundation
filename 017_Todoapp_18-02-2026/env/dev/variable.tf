variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "vnets" {
  type = map(object({
    vnet_name           = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))
}

variable "subnets" {
  type = map(object({
    subnet_name          = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "pips" {
  type = map(object({
    pip_name            = string
    location            = string
    resource_group_name = string
  }))
}

variable "nic" {
  type = map(object({
    nic_name             = string
    location             = string
    resource_group_name  = string
    virtual_network_name = string
    subnet_name          = string
    pip_name             = string
  }))
}

variable "nsg" {
  type = map(object({
    nsg_name             = string
    location             = string
    resource_group_name  = string
    subnet_name          = string
    virtual_network_name = string
  }))
}

variable "vms" {
  type = map(object({
    vm_name              = string
    location             = string
    resource_group_name  = string
    vm_size              = string
    nic_name             = string
    subnet_name          = string
    virtual_network_name = string
  }))
}
