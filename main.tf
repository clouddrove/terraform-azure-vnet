##-----------------------------------------------------------------------------
## Locals declaration for determining the id of ddos protection plan.
##-----------------------------------------------------------------------------
locals {
  ddos_pp_id = var.enable_ddos_pp == false && var.existing_ddos_pp != null ? var.existing_ddos_pp : var.enable_ddos_pp && var.existing_ddos_pp == null ? azurerm_network_ddos_protection_plan.example[0].id : null
}

##-----------------------------------------------------------------------------
## Labels module callled that will be used for naming and tags.
##-----------------------------------------------------------------------------
module "labels" {
  source      = "clouddrove/labels/azure"
  version     = "1.0.0"
  name        = var.name
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
  repository  = var.repository
  extra_tags  = var.extra_tags
}

##-----------------------------------------------------------------------------
## Below resource will deploy virtual network in your azure environment.
##-----------------------------------------------------------------------------
resource "azurerm_virtual_network" "vnet" {
  count                   = var.enable == true ? 1 : 0
  name                    = format("%s-vnet", module.labels.id)
  address_space           = var.address_spaces
  resource_group_name     = var.resource_group_name
  flow_timeout_in_minutes = var.flow_timeout_in_minutes
  location                = var.location
  dns_servers             = var.dns_servers
  bgp_community           = var.bgp_community
  edge_zone               = var.edge_zone

  dynamic "encryption" {
    for_each = var.enforcement != null ? ["encryption"] : []
    content {
      enforcement = var.enforcement
    }
  }

  dynamic "ddos_protection_plan" {
    for_each = local.ddos_pp_id != null ? ["ddos_protection_plan"] : []
    content {
      id     = local.ddos_pp_id
      enable = true
    }
  }
  tags = module.labels.tags
}

##-----------------------------------------------------------------------------
## Below resource will deploy ddos protection plan for virtual network.
##-----------------------------------------------------------------------------
resource "azurerm_network_ddos_protection_plan" "example" {
  count               = var.enable_ddos_pp && var.enable == true ? 1 : 0
  name                = format("%s-ddospp", module.labels.id)
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = module.labels.tags
}

##-----------------------------------------------------------------------------
## Below resource will deploy network watcher resource group in azure.
## To be deployed when flow logs for network security group is to be tracked.
## By default azure deploys network wather on its own, but if in azure infrastructure deployment you need network watcher with specific name than set 'enable_network_watcher' variable to true.
##-----------------------------------------------------------------------------
resource "azurerm_network_watcher" "flow_log_nw" {
  count               = var.enable && var.enable_network_watcher ? 1 : 0
  name                = format("%s-network_watcher", module.labels.id)
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = module.labels.tags
}
