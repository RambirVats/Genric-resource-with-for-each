
resource "azurerm_public_ip" "pip" {
  for_each = var.public_ips

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
  ip_version          = each.value.ip_version
  zones               = each.value.zones
  sku_tier            = each.value.sku_tier
  edge_zone           = each.value.edge_zone

  domain_name_label        = each.value.domain_name_label
  reverse_fqdn             = each.value.reverse_fqdn
  idle_timeout_in_minutes  = each.value.idle_timeout_in_minutes
  public_ip_prefix_id      = each.value.public_ip_prefix_id
  ddos_protection_mode     = each.value.ddos_protection_mode
  ddos_protection_plan_id  = each.value.ddos_protection_plan_id
  ip_tags                  = each.value.ip_tags
  tags                     = each.value.tags

 
    
  

  dynamic "timeouts" {
    for_each = each.value.timeouts == null ? [] : [each.value.timeouts]
    content {
      create = lookup(timeouts.value, "create", null)
      update = lookup(timeouts.value, "update", null)
      read   = lookup(timeouts.value, "read", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }
}



