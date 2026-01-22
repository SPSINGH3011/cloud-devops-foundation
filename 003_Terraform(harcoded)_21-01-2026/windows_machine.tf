# resource "azurerm_windows_virtual_machine" "vm1" {
#     depends_on = [ azurerm_resource_group.rg , azurerm_virtual_network.vnet1 , azurerm_public_ip.pip1 ,azurerm_subnet.subnet2 ]
#   name                = "windows-machine"
#   location            = "central india"
#   resource_group_name = "revision-rg5"
#   size                = "Standard_D2s_v5"
#   admin_username      = "adminuser"
#   admin_password      = "P@$$w0rd1234!"
#   network_interface_ids = [azurerm_network_interface.nic1.id]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2016-Datacenter"
#     version   = "latest"
#   }
# }