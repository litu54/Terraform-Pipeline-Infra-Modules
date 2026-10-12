data "azurerm_virtual_network" "datavnet" {
    for_each = var.subk
    name = each.value.vnetname
    resource_group_name = each.value.rganme
}



resource "azurerm_subnet" "sub1" {
    for_each = var.subk
    name = each.value.subname
    location = each.value.location
    resource_group_name = each.value.rganme
    virtual_network_name = data.azurerm_virtual_network.datavnet[each.key].name
    address_prefixes = each.value.address_prefix
}