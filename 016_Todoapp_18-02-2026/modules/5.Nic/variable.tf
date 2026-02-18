variable "nic" {
  type = map(object({
    nic_name            = string
    location            = string
    resource_group_name = string
    virtual_network_name = string
    subnet_name =string
    pip_name =string
  }))
}
