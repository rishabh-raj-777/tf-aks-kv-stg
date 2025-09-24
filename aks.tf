resource "azurerm_kubernetes_cluster" "sandbox_aks" {
  name                = "aks-sandbox-${random_integer.suffix_aks.result}"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "aks-sandbox"

  default_node_pool {
    name       = "default"
    node_count = 1       # Sandbox allows only small number of nodes
    vm_size    = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }

  sku_tier = "Standard"  # Sandbox-safe
}

# Random suffix for unique AKS name
resource "random_integer" "suffix_aks" {
  min = 10000
  max = 99999
}
