/*
   # A simple example on how to use this module
 */
module "descheduler" {
  source = "github.com/sparkfabrik/terraform-helm-descheduler?ref=0.4.0"

  namespace         = "default"
  chart_version     = var.chart_version
  helm_release_name = var.helm_release_name

  node_selector_labels         = var.node_selector_labels
  low_node_utilization_enabled = var.low_node_utilization_enabled
  topology_spread_constraints  = var.topology_spread_constraints
  node_fit                     = var.node_fit
  max_pods_to_evict_per_node   = var.max_pods_to_evict_per_node
}
