output "vnet_id" {
  description = "The id of the newly created vNet"
  value       = module.vnet.vnet_id
}

output "vnet_name" {
  description = "The name of the newly created vNet"
  value       = module.vnet.vnet_name
}

output "vnet_location" {
  description = "The location of the newly created vNet"
  value       = module.vnet.vnet_location
}

output "vnet_address_space" {
  description = "The address space of the newly created vNet"
  value       = module.vnet.vnet_address_space
}

output "vnet_guid" {
  description = "The GUID of the virtual network."
  value       = module.vnet.vnet_guid
}

output "vnet_rg_name" {
  description = "The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created."
  value       = module.vnet.vnet_rg_name
}