output "vnet_id" {
  value       = azurerm_virtual_network.vnet[0].id
  description = "The id of the newly created vNet"
}

output "vnet_name" {
  value       = azurerm_virtual_network.vnet[0].name
  description = "The name of the newly created vNet"
}

output "vnet_location" {
  value       = azurerm_virtual_network.vnet[0].location
  description = "The location of the newly created vNet"
}

output "vnet_address_space" {
  value       = azurerm_virtual_network.vnet[0].address_space
  description = "The address space of the newly created vNet"
}

output "vnet_guid" {
  value       = azurerm_virtual_network.vnet[0].guid
  description = "The GUID of the virtual network."
}

output "vnet_rg_name" {
  value       = azurerm_virtual_network.vnet[0].resource_group_name
  description = "The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created"
}

output "ddos_protection_plan_id" {
  value       = var.enable_ddos_pp && var.enable ? azurerm_network_ddos_protection_plan.example[0].id : null
  description = "The ID of the DDoS Protection Plan"
}

output "network_watcher_id" {
  value       = var.enable && var.enable_network_watcher ? azurerm_network_watcher.flow_log_nw[0].id : null
  description = "The ID of the Network Watcher."
}

output "network_watcher_name" {
  value       = var.enable && var.enable_network_watcher ? azurerm_network_watcher.flow_log_nw[0].name : null
  description = "The name of Network Watcher deployed."
}

output "ddos_existing_plan_id" {
  value       = azurerm_virtual_network.vnet[0].ddos_protection_plan
  description = "The ID of the DDoS Protection Plan"
}
