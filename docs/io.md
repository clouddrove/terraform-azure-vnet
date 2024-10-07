## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_spaces | The list of the address spaces that is used by the virtual network. | `list(string)` | `[]` | no |
| bgp\_community | The BGP community attribute in format <as-number>:<community-value>. | `number` | `null` | no |
| dns\_servers | The DNS servers to be used with vNet. | `list(string)` | `[]` | no |
| edge\_zone | (Optional) Specifies the Edge Zone within the Azure Region where this Virtual Network should exist. Changing this forces a new Virtual Network to be created. | `string` | `null` | no |
| enable | Flag to control the module creation | `bool` | `true` | no |
| enable\_ddos\_pp | Flag to control the resource creation | `bool` | `false` | no |
| enable\_network\_watcher | Flag to control creation of network watcher. | `bool` | `false` | no |
| enforcement | Specifies if the encrypted Virtual Network allows VM that does not support encryption. Possible values are DropUnencrypted and AllowUnencrypted. | `string` | `null` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `null` | no |
| existing\_ddos\_pp | ID of an existing DDOPS plan defined in the same subscription | `string` | `null` | no |
| extra\_tags | Variable to pass extra tags. | `map(string)` | `null` | no |
| flow\_timeout\_in\_minutes | The flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows. Possible values are between 4 and 30 minutes. | `number` | `10` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| location | The location/region where the virtual network is created. Changing this forces a new resource to be created. | `string` | `null` | no |
| managedby | ManagedBy, eg 'CloudDrove'. | `string` | `"hello@clouddrove.com"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `null` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/clouddrove/terraform-azure-vnet"` | no |
| resource\_group\_name | The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| ddos\_existing\_plan\_id | The ID of the DDoS Protection Plan |
| ddos\_protection\_plan\_id | The ID of the DDoS Protection Plan |
| network\_watcher\_id | The ID of the Network Watcher. |
| network\_watcher\_name | The name of Network Watcher deployed. |
| vnet\_address\_space | The address space of the newly created vNet |
| vnet\_guid | The GUID of the virtual network. |
| vnet\_id | The id of the newly created vNet |
| vnet\_location | The location of the newly created vNet |
| vnet\_name | The name of the newly created vNet |
| vnet\_rg\_name | The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created |
