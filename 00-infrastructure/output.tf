output "YOUR_AKS_RESOURCE_GROUP_NAME" {
  value = azurerm_kubernetes_cluster.aks.resource_group_name
}

output "YOUR_AKS_NAME" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "YOUR_REGISTRY_NAME" {
  value = azurerm_container_registry.acr.name
}

output "YOUR_REGISTRY_URL" {
  value = azurerm_container_registry.acr.login_server
}