resource "azurerm_virtual_network" "vnet1" {
    for_each = var.vnetk
    name = each.value.vnetname
    location = each.value.location
    resource_group_name = each.value.rgname
    address_space = each.value.address_space

}
