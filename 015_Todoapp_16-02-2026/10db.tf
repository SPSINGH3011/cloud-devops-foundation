
# resource "azurerm_mssql_database" "db" {
#     for_each = var.db
#   name         = each.value.name
#   server_id    = azurerm_mssql_server.example.id
#   collation    = "SQL_Latin1_General_CP1_CI_AS"
#   license_type = "LicenseIncluded"
#   max_size_gb  = 2
#   sku_name     = "S0"
#   enclave_type = "VBS"
# }

