locals {
  name        = "app"
  environment = "test"
  label_order = ["name", "environment"]
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