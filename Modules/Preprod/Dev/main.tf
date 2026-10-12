module rg {
   source = "../../azurerm_resource_group"
   rgk = var.rg
}

module vnet {
    source = "../../azurerm_network_interface"
    vnetk = var.vnet 
    depends_on = [module.rg]
}

module subnet {
    source = "../../azurerm_subnet" 
    subk = var.sub
    depends_on = [module.rg,module.vnet]

}

module publicp {
    source = "../../azurerm_publicip"
    pubk = var.pub
    depends_on = [module.rg]
}

module nick {
    source = "../../azurerm_network_interface"
    nickk = var.nick
    depends_on = [module.rg,module.subnet]
}

module vm {
    source = "../../azurerm_linux_virtual_machine"
    vmk = var.vm
    depends_on = [module.rg,module.nick]
}