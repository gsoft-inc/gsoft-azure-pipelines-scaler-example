variable "location" {
  type = string
  default = "eastus2"
}

variable "tags" {
  type = map(string)
  default = { environment: "example" }
}

variable "resource_prefixes" {
  type = list(string)
  default = ["pipelines", "agent", "example"]
}

variable "resource_group_prefixes" {
  type = list(string)
  default = ["pipelines", "agent", "example"]
}

variable "aks_default_node_pool_count" {
  type = number
  default = 1
}

variable "aks_default_node_pool_size" {
  type = string
  default = "Standard_D2_v2"
}

variable "acr_sku" {
  type = string
  default = "Basic"
}