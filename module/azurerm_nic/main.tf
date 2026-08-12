resource "azurerm_network_interface" "NIC" {
  for_each = var.nics
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_configuration_name
    subnet_id                     = data.azurerm_subnet.SUBNET[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}

data "azurerm_subnet" "SUBNET" {
    for_each = var.nics
  name                = each.value.subnet_name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

data "azurerm_public_ip" "pip" {
  for_each = var.nics
  name= each.value.pip_name
  resource_group_name = each.value.resource_group_name

  
}
