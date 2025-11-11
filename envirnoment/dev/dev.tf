variable "network" {
  
}
variable "rgs" {
  
}
variable "public_ips" {
  
}

variable "key_vault" {
  
}

module"resource_group"{
  source="../../module/resource_group"
 rg=var.rgs
}
  
module "network" {
  source = "../../module/networking"
   networks = var.network
  
}

module "azurerm_public_ip" {
  source ="../../module/azurerm_public_ip"
public_ips=var.public_ips
}


 module"key_vault"{
  depends_on = [ module.resource_group ]
source = "../../module/key_valut"
key_vaults=var.key_vault
 }
