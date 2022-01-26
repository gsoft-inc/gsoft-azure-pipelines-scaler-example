module "aks_name" {
  source   = "gsoft-inc/naming/azurerm"
  name     = "aks"
  prefixes = var.resource_prefixes
}

module "aks_node_pool_rg_name" {
  source   = "gsoft-inc/naming/azurerm//modules/general/resource_group"
  name     = "nodes"
  prefixes = concat(var.resource_group_prefixes, ["aks"])
}

module "acr_name" {
  source   = "gsoft-inc/naming/azurerm//modules/containers/container_registry"
  name     = "acr"
  prefixes = var.resource_prefixes
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = module.aks_name.result
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  node_resource_group = module.aks_node_pool_rg_name.result
  dns_prefix          = module.aks_name.result

  default_node_pool {
    name           = "default"
    node_count     = var.aks_default_node_pool_count
    vm_size        = var.aks_default_node_pool_size
    tags           = var.tags
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

resource "azurerm_container_registry" "acr" {
  name                = module.acr_name.result
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = var.acr_sku
  tags                = var.tags
}