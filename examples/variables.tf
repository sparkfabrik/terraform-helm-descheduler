variable "helm_release_name" {
  description = "Name of the helm release."
  type        = string
  default     = "descheduler"
}

variable "chart_version" {
  description = "Chart version to install."
  type        = string
  default     = "0.29.0"
}

variable "node_selector_labels" {
  description = "Node selector labels used by descheduler for limit pod eviction in selected nodes."
  type        = map(string)
  default     = {}
}

variable "low_node_utilization_enabled" {
  description = "Enable low node utilization descheduler strategy."
  type        = bool
  default     = true
}
