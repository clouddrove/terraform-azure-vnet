#Module      : LABEL
#Description : Terraform label module variables.
variable "name" {
  type        = string
  default     = null
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "repository" {
  type        = string
  default     = "https://github.com/clouddrove/terraform-azure-vnet"
  description = "Terraform current module repo"

  validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^https://", var.repository))
    error_message = "The module-repo value must be a valid Git repo link."
  }
}

variable "environment" {
  type        = string
  default     = null
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. `name`,`application`."
}

variable "managedby" {
  type        = string
  default     = "hello@clouddrove.com"
  description = "ManagedBy, eg 'CloudDrove'."
}

variable "extra_tags" {
  type        = map(string)
  default     = null
  description = "Variable to pass extra tags."
}

variable "enable" {
  type        = bool
  default     = true
  description = "Flag to control the module creation"
}

variable "resource_group_name" {
  type        = string
  default     = null
  description = "The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  default     = null
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
}

variable "address_spaces" {
  type        = list(string)
  default     = []
  description = "The list of the address spaces that is used by the virtual network."
}
variable "bgp_community" {
  type        = number
  default     = null
  description = "The BGP community attribute in format <as-number>:<community-value>."
}
variable "edge_zone" {
  type        = string
  default     = null
  description = " (Optional) Specifies the Edge Zone within the Azure Region where this Virtual Network should exist. Changing this forces a new Virtual Network to be created."
}
variable "flow_timeout_in_minutes" {
  type        = number
  default     = 10
  description = "The flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows. Possible values are between 4 and 30 minutes."
}

# If no values specified, this defaults to Azure DNS
variable "dns_servers" {
  type        = list(string)
  default     = []
  description = "The DNS servers to be used with vNet."
}

variable "enable_ddos_pp" {
  type        = bool
  default     = false
  description = "Flag to control the resource creation"
}

variable "existing_ddos_pp" {
  type        = string
  default     = null
  description = "ID of an existing DDOPS plan defined in the same subscription"
}

variable "enable_network_watcher" {
  type        = bool
  default     = false
  description = "Flag to control creation of network watcher."
}

variable "enforcement" {
  type        = string
  default     = null
  description = "Specifies if the encrypted Virtual Network allows VM that does not support encryption. Possible values are DropUnencrypted and AllowUnencrypted."
}



