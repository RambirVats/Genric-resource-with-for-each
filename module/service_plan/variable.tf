variable "azsp" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    os_type             = string
    sku_name            = string
  }))
}
