output "azurerm_resource_group" {
  value = {
    for rg, o in azurerm_resource_group.rgs : rg => [o.name , o.location ,o.id]
  }
}



# | Part                         | Meaning                    |
# | ---------------------------- | -------------------------- |
# | `rg`                         | key (rg1, rg2)             |
# | `o`                          | object (resource instance) |
# | `azurerm_resource_group.rgs` | all created RGs            |
# | `rg => o.name`               | map return karega          |
