output "vnet_id" {
  value       = module.vnet.vnet_id
  description = "The id of the newly created vNet"
}

output "vnet_name" {
  value       = module.vnet.vnet_name
  description = "The name of the newly created vNet"
}

output "vnet_location" {
  value       = module.vnet.vnet_location
  description = "The location of the newly created vNet"
}

output "vnet_address_space" {
  value       = module.vnet.vnet_address_space
  description = "The address space of the newly created vNet"
}

output "vnet_guid" {
  value       = module.vnet.vnet_guid
  description = "The GUID of the virtual network."
}

output "vnet_rg_name" {
  value       = module.vnet.vnet_rg_name
  description = "The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created."
}

output "ddos_plan_id" {
  value       = module.vnet.ddos_existing_plan_id
  description = "The ID of the Exiting DDoS Protection Plan"
}
