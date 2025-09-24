    variable "subscription_id" {
      description = "Azure subscription id"
      type = string
    }

    variable "resource_group_name" {
      description = "Name of the resource group"
      type = string
    }

    variable "location" {
      description = "Azure region"
      type = string
      default = "West US"
    }