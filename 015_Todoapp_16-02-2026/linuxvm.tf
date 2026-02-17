resource "azurerm_linux_virtual_machine" "linvm" {
depends_on = [ azurerm_resource_group.rgs, azurerm_virtual_network.vnet,azurerm_subnet.subnet,azurerm_public_ip.pip,azurerm_network_interface.nic,azurerm_network_security_group.nsg ]
  for_each            = var.vms
  name                = each.value.vm_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  size                = each.value.vm_size
  admin_username      = "azureuser"
  admin_password      = "Password@1234"
  disable_password_authentication = false

  network_interface_ids = [
    data.azurerm_network_interface.nic[each.key].id
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
   provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y nginx",
      "sudo systemctl start nginx"
    ]

    connection {
      type        = "ssh"
      user        = "azureuser"
      password = "Password@1234"
      host        = data.azurerm_public_ip.pip[each.key].ip_address
    }
  }
}
