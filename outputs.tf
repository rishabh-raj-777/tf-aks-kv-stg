# Key Vault URI
output "key_vault_uri" {
  description = "The URI of the created Key Vault"
  value       = azurerm_key_vault.sandbox_kv.vault_uri
}

# Storage Account name
output "storage_account_name" {
  description = "The name of the created Storage Account"
  value       = azurerm_storage_account.sandbox_sa.name
}

# AKS cluster name
output "aks_cluster_name" {
  description = "The name of the created AKS cluster"
  value       = azurerm_kubernetes_cluster.sandbox_aks.name
}

# AKS kubeconfig
output "kube_config" {
  description = "Kubeconfig for the AKS cluster"
  value       = azurerm_kubernetes_cluster.sandbox_aks.kube_config_raw
  sensitive   = true
}
