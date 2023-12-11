provider "azurerm" {
  features {}
}

locals {
  name        = "app"
  environment = "test"
}

##-----------------------------------------------------------------------------
## Resource Group module call
## Resource group in which all resources will be deployed.
##-----------------------------------------------------------------------------
module "resource_group" {
  source      = "clouddrove/resource-group/azure"
  version     = "1.0.2"
  name        = local.name
  environment = local.environment
  location    = "North Europe"
}

##-----------------------------------------------------------------------------
## Virtual Network module call.
##-----------------------------------------------------------------------------
module "vnet" {
  source                 = "../../"
  name                   = local.name
  environment            = local.environment
  resource_group_name    = module.resource_group.resource_group_name
  location               = module.resource_group.resource_group_location
  address_space          = "10.0.0.0/16"
  enable_network_watcher = false # To be set true when network security group flow logs are to be tracked and network watcher with specific name is to be deployed.
}
