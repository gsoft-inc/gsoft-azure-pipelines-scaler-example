module "resource_group_name" {
  source   = "gsoft-inc/naming/azurerm//modules/general/resource_group"
  name     = "rg"
  prefixes = var.resource_group_prefixes
}

resource "azurerm_resource_group" "rg" {
  name     = module.resource_group_name.result
  location = var.location
  tags     = var.tags
}