variable "nsg" {
  type = map(object({
    nsg_name            = string
    location            = string
    resource_group_name = string
    subnet_name = string
    virtual_network_name = string
  }))
}