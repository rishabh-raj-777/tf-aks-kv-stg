resource "azurerm_storage_account" "sandbox_sa" {
  name                     = "stgsandbox${random_integer.suffix-1.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  //allow_blob_public_access = false
  is_hns_enabled           = false
}

# Random suffix for unique name
resource "random_integer" "suffix-1" {
  min = 10000
  max = 99999
}
