terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~>=5.0.0"
        }
    }

  backend  "azurerm" {
    resource_group_name = "anilrgstt"
    storage_account_name = "statemod1234"
    conatiner_name = "tfstate"
    key = "Prod1.tfstate"

}   

}
provider "azurerm" {
    features {}
}

