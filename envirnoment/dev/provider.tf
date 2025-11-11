terraform {
  required_providers {
    azurerm={
source = "hashicorp/azurerm"
version = "4.51.0"

    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "b85b825e-360f-475e-a28b-227b74b5f4f8"
}