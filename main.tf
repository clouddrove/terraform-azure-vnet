locals {
  ddos_pp_id = var.enable_ddos_pp ? azurerm_network_ddos_protection_plan.example[0].id : ""
}

module "labels" {

  source  = "clouddrove/labels/azure"
  version = "1.0.0"

  name        = var.name
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
  repository  = var.repository
}

resource "azurerm_virtual_network" "vnet" {
  count                   = var.enable == true ? 1 : 0
  name                    = format("%s-vnet", module.labels.id)
  resource_group_name     = var.resource_group_name
  location                = var.location
  address_space           = length(var.address_spaces) == 0 ? [var.address_space] : var.address_spaces
  dns_servers             = var.dns_servers
  bgp_community           = var.bgp_community
  edge_zone               = var.edge_zone
  flow_timeout_in_minutes = var.flow_timeout_in_minutes
  dynamic "ddos_protection_plan" {
    for_each = local.ddos_pp_id != "" ? ["ddos_protection_plan"] : []
    content {
      id     = local.ddos_pp_id
      enable = true
    }
  }
  tags = module.labels.tags
}

resource "azurerm_network_ddos_protection_plan" "example" {
  count               = var.enable_ddos_pp && var.enable == true ? 1 : 0
  name                = format("%s-ddospp", module.labels.id)
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = module.labels.tags
}

resource "azurerm_network_watcher" "test" {
  count               = var.enable_network_watcher ? 1 : 0
  name                = format("%s-network_watcher", module.labels.id)
  location            = var.location
  resource_group_name = var.resource_group_name
}


resource "azurerm_network_watcher_flow_log" "test" {
  count                = var.enable_flow_logs ? 1 : 0
  network_watcher_name = join("", azurerm_network_watcher.test.*.name)
  resource_group_name  = var.resource_group_name
  name                 = format("%s-flow_logs", module.labels.id)

  network_security_group_id = var.network_security_group_id
  storage_account_id        = var.storage_account_id
  enabled                   = true

  retention_policy {
    enabled = var.retention_policy_enabled
    days    = var.retention_policy_days
  }

  traffic_analytics {
    enabled               = var.enable_traffic_analytics
    workspace_id          = var.workspace_id
    workspace_region      = var.location
    workspace_resource_id = var.workspace_resource_id
    interval_in_minutes   = 10
  }
}
