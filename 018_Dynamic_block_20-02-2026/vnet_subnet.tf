resource "azurerm_virtual_network" "vnet" {
  depends_on          = [azurerm_resource_group.rg]
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]

 #   subnet {
  #     name             = "subnet1"
  #     address_prefixes = ["10.0.1.0/24"]
  #   }
  dynamic "subnet" {
    for_each = var.subnets  #for_each = var.subnet  #variable
    content {
      name             = subnet.value.subnet_name
     address_prefixes= subnet.value.address_prefixes #["10.0.1.0/24"]
    }
  }


 

}

