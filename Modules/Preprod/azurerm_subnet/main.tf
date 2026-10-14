data "azurerm_virtual_network" "datavnet" {
    for_each = var.subk
    name = each.value.vnetname
    resource_group_name = each.value.rgname
}



resource "azurerm_subnet" "sub1" {
    for_each = var.subk
    name = each.value.subname
    resource_group_name = each.value.rgname
    virtual_network_name = data.azurerm_virtual_network.datavnet[each.key].name
    address_prefixes = each.value.address_prefixes
}