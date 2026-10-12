resource "azurerm_public_ip" "pub1" {
   for_each = var.pubk 
    name = each.value.pubname
    resource_group_name = each.value.rgname
    location = each.value.location
    allocation_method = each.value.allocation_method
}