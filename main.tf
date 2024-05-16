locals {
  k8s_full_labels = merge(
    var.k8s_labels,
    var.k8s_additional_labels,
  )

  final_namespace             = var.create_namespace ? resource.kubernetes_namespace_v1.this[0].metadata[0].name : data.kubernetes_namespace_v1.this[0].metadata[0].name
  node_selector_labels_string = var.node_selector_labels == null ? "" : join(",", [for k, v in var.node_selector_labels : "${k}=${v}"])
}

resource "kubernetes_namespace_v1" "this" {
  count = var.create_namespace ? 1 : 0

  metadata {
    name = var.namespace
    labels = merge(
      { name = var.namespace },
      local.k8s_full_labels,
    )
  }
}

data "kubernetes_namespace_v1" "this" {
  count = var.create_namespace ? 0 : 1

  metadata {
    name = var.namespace
  }
}

resource "helm_release" "this" {
  name       = var.helm_release_name
  repository = "https://kubernetes-sigs.github.io/descheduler/"
  chart      = "descheduler"
  version    = var.chart_version
  namespace  = local.final_namespace

  values = concat(
    [
      templatefile(
        "${path.module}/files/values.yaml.tftpl",
        {
          common_labels                = local.k8s_full_labels
          node_selector_labels_string  = local.node_selector_labels_string
          low_node_utilization_enabled = var.low_node_utilization_enabled
          service_monitor_enabled      = var.service_monitor_enabled
          service_monitor_namespace    = var.service_monitor_namespace
        }
      ),
    ],
    var.additional_values
  )
}
