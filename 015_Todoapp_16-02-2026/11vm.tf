resource "azurerm_linux_virtual_machine" "vm" {
  depends_on                      = [azurerm_resource_group.rgs, azurerm_virtual_network.vnet, azurerm_subnet.subnet, azurerm_public_ip.pip, azurerm_network_security_group.nsg, azurerm_subnet_network_security_group_association.as]
  for_each                        = var.vms
  name                            = each.value.vm_name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = "Standard_D2a_v4"
  admin_username                  = "adminuser"
  admin_password                  = "adminuser@123"
  disable_password_authentication = false
  network_interface_ids = [
    data.azurerm_network_interface.data_nic[each.key].id,
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}


data "azurerm_network_interface" "data_nic" {
  depends_on          = [azurerm_network_interface.nic]
  for_each            = var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

# output "network_interface_id" {
#   value = data.azurerm_network_interface.data_nic.id
# }
