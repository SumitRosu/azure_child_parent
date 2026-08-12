resource "azurerm_network_security_group" "nsgs" {
    for_each = var.nsg
    name                = each.value.name
   resource_group_name = each.value.resource_group_name
    location            = each.value.location
}

resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
    for_each = var.nsg
    subnet_id                 = data.azurerm_subnet.subnet[each.key].id
    network_security_group_id = azurerm_network_security_group.nsgs[each.key].id
}

data "azurerm_subnet" "subnet" {
    for_each = var.nsg
    name                 = each.value.subnet_name
    resource_group_name  = each.value.resource_group_name
    virtual_network_name = each.value.virtual_network_name
}