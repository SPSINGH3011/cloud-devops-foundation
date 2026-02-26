variable "db" {
  type = map(object({
    server_name                   = string
    resource_group_name           = string
    location                      = string
    version                       = string
    public_network_access_enabled = bool
    administrator_login           = string
    administrator_login_password  = string
    minimum_tls_version           = string
    db_name                       = string
    collation                     = string
    license_type                  = string
    max_size_gb                   = number
    sku_name                      = string
    enclave_type                  = string
  }))
}