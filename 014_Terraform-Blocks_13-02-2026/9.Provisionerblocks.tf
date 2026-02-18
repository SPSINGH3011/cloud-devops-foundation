# 👉 They are used to execute scripts or copy files after a resource is created.
# 🔹 Types of Provisioners
# Terraform mainly supports:
# local-exec
# remote-exec
# file
# Let’s understand each with Azure practical examples.

# In Terraform, local-exec, remote-exec, and file are provisioners. They are used to execute commands or copy files after resource creation. However, in production Azure environments, we avoid provisioners and prefer using VM extensions, cloud-init, or configuration management tools for better reliability.

# 1️⃣ local-exec Provisioner
# Runs command on your local machine (or pipeline agent).
# local-exec runs a command on the machine where Terraform is executed.
resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "az group list"
  }
}

# 2️⃣ remote-exec Provisioner

# Runs command inside a remote resource, like an Azure VM.
# Needs SSH (Linux) or WinRM (Windows).
# remote-exec runs commands inside a remote VM using SSH or WinRM.
# resource "azurerm_linux_virtual_machine" "vm" {
#   name                = "devvm"
#   resource_group_name = "rg-dev"
#   location            = "Central India"
#   size                = "Standard_B1s"

#   admin_username = "azureuser"

#   network_interface_ids = [
#     azurerm_network_interface.nic.id
#   ]

#   admin_ssh_key {
#     username   = "azureuser"
#     public_key = file("~/.ssh/id_rsa.pub")
#   }
# }

# resource "null_resource" "vm_setup" {
#   depends_on = [azurerm_linux_virtual_machine.vm]

#   provisioner "remote-exec" {
#     inline = [
#       "sudo apt update",
#       "sudo apt install nginx -y"
#     ]

#     connection {
#       type        = "ssh"
#       user        = "azureuser"
#       private_key = file("~/.ssh/id_rsa")
#       host        = azurerm_linux_virtual_machine.vm.public_ip_address
#     }
#   }
# }

# 3️⃣ file Provisioner
# Copies file from local machine to remote VM.
# file provisioner copies files from local machine to remote VM.

# resource "null_resource" "copy_script" {

#   provisioner "file" {
#     source      = "script.sh"
#     destination = "/home/azureuser/script.sh"

#     connection {
#       type        = "ssh"
#       user        = "azureuser"
#       private_key = file("~/.ssh/id_rsa")
#       host        = azurerm_linux_virtual_machine.vm.public_ip_address
#     }
#   }
# }

# resource "null_resource" "copy_script" {

#   provisioner "file" {
#     source      = "script.sh"
#     destination = "/home/azureuser/script.sh"

#     connection {
#       type        = "ssh"
#       user        = "azureuser"
#       private_key = file("~/.ssh/id_rsa")
#       host        = azurerm_linux_virtual_machine.vm.public_ip_address
#     }
#   }
# }