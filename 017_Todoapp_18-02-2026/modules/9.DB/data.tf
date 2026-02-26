# data "azuread_user" "aad_admin" {
#   user_principal_name = "satya@todo.com"   # <-- apna real UPN daalo
# }

data "azurerm_mssql_server" "serverid" {
  depends_on          = [azurerm_mssql_server.mysql_server]
  for_each            = var.db
  name                = each.value.server_name
  resource_group_name = each.value.resource_group_name
}