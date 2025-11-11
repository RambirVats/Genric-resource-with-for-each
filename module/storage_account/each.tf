

resource "azurerm_storage_account" "om" {
  for_each                      = var.storage_account
  


  # Required arguments
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  location                      = each.value.location
  account_tier                  = each.value.account_tier
  account_replication_type      = each.value.account_replication_type

  

  # Optional arguments
  account_kind                  = each.value.account_kind
  access_tier                   = each.value.access_tier
  
  min_tls_version               = each.value.min_tls_version
  
  shared_access_key_enabled     = each.value.shared_access_key_enabled
  is_hns_enabled                = each.value.is_hns_enabled
  nfsv3_enabled                 = each.value.nfsv3_enabled
  public_network_access_enabled = each.value.public_network_access_enabled
  large_file_share_enabled      = each.value.large_file_share_enabled
  default_to_oauth_authentication = each.value.default_to_oauth_authentication
  allow_nested_items_to_be_public = each.value.allow_nested_items_to_be_public
  sftp_enabled                  = each.value.sftp_enabled
  local_user_enabled            = each.value.local_user_enabled

  
  dynamic"network_rules"{
    for_each ={
      rule1={
    default_action             = "Deny"   
    bypass                     = ["AzureServices"]
    ip_rules                    = ["152.58.117.215/30"]
}
    
  }

content {
  default_action             = network_rules.value.default_action
    bypass                     =network_rules.value.bypass
    ip_rules                   = network_rules.value.ip_rules 
}
    
  }
  
  
  
}

