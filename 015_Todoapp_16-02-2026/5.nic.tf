resource "azurerm_network_interface" "nic" {
  depends_on          = [azurerm_subnet.subnet, azurerm_resource_group.rgs ,azurerm_public_ip.pip]
  for_each            = var.nic
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.data_subnet[each.key].id #datablock
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.data_pip[each.key].id
  }
}

#subnet ka datablock
data "azurerm_subnet" "data_subnet" {
  depends_on           = [azurerm_virtual_network.vnet, azurerm_resource_group.rgs]
  for_each             = var.nic
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}


data "azurerm_public_ip" "data_pip" {
  depends_on          = [azurerm_public_ip.pip, azurerm_resource_group.rgs]
  for_each            = var.nic
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

