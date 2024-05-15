variable "namespace" {
  description = "Namespace to install the descheduler."
  type        = string
  default     = "descheduler"
}

variable "create_namespace" {
  description = "Create namespace for the ingress controller. If false, the namespace must be created before using this module."
  type        = bool
  default     = true
}

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

variable "k8s_labels" {
  description = "Set of labels to apply to all resources."
  type        = map(string)
  default = {
    managed-by = "terraform"
  }
}

variable "k8s_additional_labels" {
  description = "Set of additional labels to apply to all resources."
  type        = map(string)
  default     = {}
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
