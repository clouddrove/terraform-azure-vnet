output "vnet_id" {
  description = "The id of the newly created vNet"
  value       = azurerm_virtual_network.vnet.*.id
}

output "vnet_name" {
  description = "The name of the newly created vNet"
  value       = azurerm_virtual_network.vnet.*.name
}

output "vnet_location" {
  description = "The location of the newly created vNet"
  value       = azurerm_virtual_network.vnet.*.location
}

output "vnet_address_space" {
  description = "The address space of the newly created vNet"
  value       = azurerm_virtual_network.vnet.*.address_space
}

output "vnet_guid" {
  description = "The GUID of the virtual network."
  value       = azurerm_virtual_network.vnet.*.guid
}

output "vnet_rg_name" {
  description = "The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created"
  value       = azurerm_virtual_network.vnet.*.resource_group_name
}

output "ddos_protection_plan_id" {
  value       = join("", azurerm_network_ddos_protection_plan.example.*.id)
  description = "The ID of the DDoS Protection Plan"
}
output "network_watcher_id" {
  value       = join("", azurerm_network_watcher.flow_log_nw.*.id)
  description = "The ID of the Network Watcher."
}

output "network_watcher_name" {
  value       = join("", azurerm_network_watcher.flow_log_nw.*.name)
  description = "The name of Network Watcher deployed."
}