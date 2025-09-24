data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "sandbox_kv" {
  name = "kv-sandbox-${random_integer.suffix.result}"
  resource_group_name = var.resource_group_name
  location = var.location

  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name = "standard"

  soft_delete_retention_days = 7
  purge_protection_enabled = false
}

resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}