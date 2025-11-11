variable "public_ips" {
  description = "Map of public IP configurations"
  type = map(object({
    name                       = string
    location                   = string
    resource_group_name         = string
    allocation_method           = string
    sku                         = string
    ip_version                  = string
    zones                       = optional(list(string))
    sku_tier                    = optional(string)
    edge_zone                   = optional(string)
    domain_name_label           = optional(string)
    reverse_fqdn                = optional(string)
    idle_timeout_in_minutes     = optional(number)
    public_ip_prefix_id         = optional(string)
    ddos_protection_mode        = optional(string)
    ddos_protection_plan_id     = optional(string)
    ip_tags                     = optional(map(string))
    tags                        = optional(map(string))

    
    # Nested block: timeouts
    timeouts = optional(object({
      create = optional(string)
      read   = optional(string)
      update = optional(string)
      delete = optional(string)
    }))
  }))
}

