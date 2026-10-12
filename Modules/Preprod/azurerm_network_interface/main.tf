data "azurerm_subnet" "datapubsub" {
    for_each = var.nickk
    name = each.value.subname
    resource_group_name = each.value.rgname
    virtual_network_name = each.value.vnetname
}


data "azurerm_public_ip" "datapub" {
    for_each = var.nickk
    name = each.value.pubname
    resource_group_name = each.value.rgname
}


resource "azurerm_network_interface" "nick1" {
    for_each = var.nickk
    name = each.value.nickname
    resource_group_name = each.value.rgname
    location = each.value.location 


    ip_configuration {
        name = each.value.ipname
        subnet_id = data.azurerm_subnet.datapubsub[each.key].id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = data.azurerm_public_ip.datapub[each.key].id

 }
}