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