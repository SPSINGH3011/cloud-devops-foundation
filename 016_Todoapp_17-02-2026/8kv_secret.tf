# resource "azurerm_key_vault_secret" "kv-secret" {
#   for_each = var.kv_secret
#   name         = each.value.name
#   value        = "szechuan"
#   key_vault_id = azurerm_key_vault.example.id
# }

