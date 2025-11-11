variable "networks" {
  description = "Map of Virtual Networks and their full configuration including subnets"

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)

    dns_servers             = optional(list(string))
    bgp_community           = optional(string)
    edge_zone               = optional(string)
    flow_timeout_in_minutes = optional(number)
    tags                    = optional(map(string))

    subnets = optional(map(object({
      name                                           = string
      address_prefixes                               = optional(list(string))
      address_prefix                                 = optional(string)
      private_endpoint_network_policies_enabled      = optional(bool)
      private_link_service_network_policies_enabled  = optional(bool)
      service_endpoints                              = optional(list(string))
      service_endpoint_policy_ids                    = optional(list(string))
      route_table_id                                 = optional(string)
      network_security_group_id                      = optional(string)
      default_outbound_access_enabled                = optional(bool)
      enforce_private_link_endpoint_network_policies = optional(bool)
      enforce_private_link_service_network_policies  = optional(bool)
    })))
  }))
}
