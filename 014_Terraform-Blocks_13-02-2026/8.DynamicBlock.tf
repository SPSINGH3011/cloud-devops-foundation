# 8️⃣ Dynamic Block (dynamic)
# 🔹 What is it?

# Used to generate repeated nested blocks dynamically.

# Very useful when using loops inside resources.

# ✅ Azure Example: NSG with Multiple Rules
# variable "ports" {
#   default = [80, 443, 22]
# }

# resource "azurerm_network_security_group" "nsg" {
#   name                = "example-nsg"
#   location            = "Central India"
#   resource_group_name = "rg-dev"

#   dynamic "security_rule" {
#     for_each = var.ports
#     content {
#       name                       = "rule-${security_rule.value}"
#       priority                   = 100 + security_rule.value
#       direction                  = "Inbound"
#       access                     = "Allow"
#       protocol                   = "Tcp"
#       source_port_range          = "*"
#       destination_port_range     = security_rule.value
#       source_address_prefix      = "*"
#       destination_address_prefix = "*"
#     }
#   }
# }

# 👉 Instead of writing 3 rules manually, dynamic block creates them automatically.

# variable "infra_config" {
#   type = map(object({
#     location      = string
#     rg_name       = string
#     vnet_name     = string
#     address_space = list(string)
#     subnets = map(object({
#       address_prefix = string
#     }))
#   }))

#   default = {
#     dev = {
#       location      = "Central India"
#       rg_name       = "rg-dev"
#       vnet_name     = "vnet-dev"
#       address_space = ["10.0.0.0/16"]

#       subnets = {
#         web = {
#           address_prefix = "10.0.1.0/24"
#         }
#         app = {
#           address_prefix = "10.0.2.0/24"
#         }
#       }
#     }
#   }
# }

# resource "azurerm_resource_group" "rg" {
#   for_each = var.infra_config

#   name     = each.value.rg_name
#   location = each.value.location
# }

# resource "azurerm_virtual_network" "vnet" {
#     depends_on = [ azurerm_resource_group.rg ]
#   for_each = var.infra_config

#   name                = each.value.vnet_name
#   location            = each.value.location
#   resource_group_name = azurerm_resource_group.rg[each.key].name
#   address_space       = each.value.address_space

#   dynamic "subnet" {
#     for_each = each.value.subnets

#     content {
#       name           = subnet.key
#      address_prefixes = [subnet.value.address_prefix]
#     }
#   }
# }