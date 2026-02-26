

resource "azurerm_mssql_server" "mysql_server" {

  for_each                      = var.db
  name                          = each.value.server_name
  resource_group_name           = each.value.resource_group_name
  location                      = each.value.location
  version                       = each.value.version
  administrator_login           = each.value.administrator_login
  administrator_login_password  = each.value.administrator_login_password
  minimum_tls_version           = each.value.minimum_tls_version
  public_network_access_enabled = each.value.public_network_access_enabled

  # azuread_administrator {
  #   login_username = data.azuread_user.aad_admin.user_principal_name
  #   object_id      = data.azuread_user.aad_admin.object_id
  # }
}

resource "azurerm_mssql_database" "Database" {
  depends_on   = [azurerm_mssql_server.mysql_server]
  for_each     = var.db
  name         = each.value.db_name
  server_id    = data.azurerm_mssql_server.serverid[each.key].id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type
}

