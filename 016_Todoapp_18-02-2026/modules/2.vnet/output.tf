output "vnet" {
  value = {
    for vnet, o in azurerm_virtual_network.vnet : vnet => [o.name , o.location ,o.id]
  }
}



# | Part                         | Meaning                    |
# | ---------------------------- | -------------------------- |
# | `rg`                         | key (rg1, rg2)             |
# | `o`                          | object (resource instance) |
# | `azurerm_resource_group.rgs` | all created RGs            |
# | `rg => o.name`               | map return karega          |
