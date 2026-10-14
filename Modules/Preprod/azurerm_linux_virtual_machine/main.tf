data "azurerm_network_interface" "datanic" {
    for_each = var.vmk
    name = each.value.nickname
    resource_group_name = each.value.rgname

}

resource "azurerm_linux_virtual_machine" "vm1" {
    for_each = var.vmk
    name = each.value.vmname
    location = each.value.location
    size = each.value.size
    resource_group_name = each.value.rgname
    network_interface_ids = [data.azurerm_network_interface.datanic[each.key].id]
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password
    disable_password_authentication = false

    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }
   source_image_reference {
      publisher = "Canonical"
      offer = "0001-com-ubuntu-server-jammy"
      sku = "22_04-lts"
      version = "latest"
   }



}