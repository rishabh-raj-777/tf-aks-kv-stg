terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id                 = var.subscription_id
  resource_provider_registrations = "none"  # v4+ only
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
}

provider "random" {}
