variable "pips" {
  type = map(object({
    pip_name            = string
    location            = string
    resource_group_name = string
  }))
}