resource "azurerm_virtual_network" "network" {
  for_each = var.networks

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  dns_servers         = lookup(each.value, "dns_servers", null)
  bgp_community       = lookup(each.value, "bgp_community", null)
  edge_zone           = lookup(each.value, "edge_zone", null)
  flow_timeout_in_minutes = lookup(each.value, "flow_timeout_in_minutes", null)
  tags                = lookup(each.value, "tags", null)

  # --- Dynamic Subnet Block ---
  dynamic "subnet" {
    for_each = each.value.subnets != null ? each.value.subnets : {}



    content {
      name                                           = subnet.value.name
      address_prefixes                               = subnet.value.address_prefixes
      
      private_link_service_network_policies_enabled  = lookup(subnet.value, "private_link_service_network_policies_enabled", true)
      service_endpoints                              = lookup(subnet.value, "service_endpoints", null)
      service_endpoint_policy_ids                    = lookup(subnet.value, "service_endpoint_policy_ids", null)
      
      route_table_id                                 = lookup(subnet.value, "route_table_id", null)
      
      default_outbound_access_enabled                = lookup(subnet.value, "default_outbound_access_enabled", null)
      
    }
  }
}
