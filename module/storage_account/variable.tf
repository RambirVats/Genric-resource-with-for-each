variable "storage_account" {
  description = "Map of storage accounts to create"

  type = map(object({
    # Required
    name                          = string
    resource_group_name           = string
    location                      = string
    account_tier                  = string
    account_replication_type      = string

    # Optional
    account_kind                  = optional(string)
    access_tier                   = optional(string)
    enable_https_traffic_only     = optional(bool)
    min_tls_version               = optional(string)
    allow_blob_public_access      = optional(bool)
    shared_access_key_enabled     = optional(bool)
    is_hns_enabled                = optional(bool)
    nfsv3_enabled                 = optional(bool)
    public_network_access_enabled = optional(bool)
    large_file_share_enabled      = optional(bool)
    default_to_oauth_authentication = optional(bool)
    allow_nested_items_to_be_public = optional(bool)
    sftp_enabled                  = optional(bool)
    local_user_enabled            = optional(bool)
    tags                          = optional(map(string))

    # network_rules = optional(object({
    #   default_action = string
    #   bypass         = optional(list(string))
    #   ip_rules       = optional(list(string))
    # }))
  }))
}
