/*
   # A simple example on how to use this module
 */
module "example" {
  source  = "github.com/sparkfabrik/terraform-module-template"
  version = ">= 0.1.0"

  name = var.name
}

module "descheduler" {
  source = "github.com/sparkfabrik/terraform-helm-descheduler?ref=main"

  namespace         = "default"
  chart_version     = var.chart_version
  helm_release_name = var.helm_release_name

  node_selector_labels         = var.node_selector_labels
  low_node_utilization_enabled = var.low_node_utilization_enabled
}
