resource "azurerm_resource_group" "rg1" {
    for_each = var.rgk
    name = each.value.rgname
    location = each.value.location
}