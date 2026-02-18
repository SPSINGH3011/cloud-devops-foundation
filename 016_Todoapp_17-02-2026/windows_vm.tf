# resource "azurerm_windows_virtual_machine" "vm" {
# depends_on = [ azurerm_resource_group.rgs, azurerm_virtual_network.vnet,azurerm_subnet.subnet,azurerm_public_ip.pip,azurerm_network_interface.nic,azurerm_network_security_group.nsg ]
#   for_each            = var.vms
#   name                = each.value.vm_name
#   location            = each.value.location
#   resource_group_name = each.value.resource_group_name
#   size                = each.value.vm_size
#   admin_username      = "azureuser"
#   admin_password      = "Password@1234"
#   network_interface_ids = [
#     data.azurerm_network_interface.nic[each.key].id
#   ]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2022-datacenter-azure-edition"
#     version   = "latest"
#   }
# }
