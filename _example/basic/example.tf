provider "azurerm" {
  features {}
}

locals {
  name        = "app"
  environment = "test"
}

##-----------------------------------------------------------------------------
## Virtual Network module call.
##-----------------------------------------------------------------------------
module "vnet" {
  source                 = "../../"
  name                   = local.name
  environment            = local.environment
  resource_group_name    = "testrg"
  location               = "NorthEurope"
  address_spaces         = ["10.0.0.0/16"]
  enable_network_watcher = false # To be set true when network security group flow logs are to be tracked and network watcher with specific name is to be deployed.
}