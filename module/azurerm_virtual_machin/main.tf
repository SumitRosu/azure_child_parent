resource "azurerm_linux_virtual_machine" "VMM" {
    for_each = var.vms
    name = each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location

    size                = "Standard_D4_v5"
  admin_username      = each.value.admin_username
  admin_password  = each.value.admin_password
  network_interface_ids = [data.azurerm_network_interface.nifc[each.key].id]
  disable_password_authentication = "false"
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

data "azurerm_network_interface" "nifc" {
    for_each = var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}
