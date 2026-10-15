rg = {
    dev = {
        rgname = "Prodlx-modulerg"
        location = "East us"


    }
}
vnet = {
    dev = {
   vnetname  = "devvnet" 
   rgname = "Prodlx-modulerg"
   location = "East us"
   address_space = ["10.0.0.0/16"]
}

}

sub = {
    dev = {
      subname = "frontendsub"  
      vnetname  = "devvnet"
      rgname = "Prodlx-modulerg"
      address_prefixes = ["10.0.2.0/24"]
    }
}


pub = {
    dev = {
        pubname = "frontendip"
        rgname = "Prodlx-modulerg"
        location = "East us"
        allocation_method = "Static"

    }
}



nick = {
    dev = {
        nickname = "fronentdnic"
        rgname = "Prodlx-modulerg"
        location = "East us"
        ipname = "frontip"

    vnetname = "devvnet"
    subname  = "frontendsub"
    pubname  = "frontendip"
    }


}


vm = {
    dev = {
      vmname = "UbuntuProd"
      location = "East us"
      rgname = "Prodlx-modulerg"
      size = "Standard_B2s"
      admin_username = "sysadmin"
      admin_password = "Test1234"
      nickname       = "fronentdnic"
    #   network_interface_ids = module.nic.nic_id

    }


}

