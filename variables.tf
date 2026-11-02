variable "create_namespace" {
  description = "Create namespace for the descheduler application. If false, the namespace must be created before using this module."
  type        = bool
  default     = true
}

variable "namespace" {
  description = "Namespace to install the descheduler."
  type        = string
  default     = "descheduler"
}

variable "helm_release_name" {
  description = "Name of the helm release."
  type        = string
  default     = "descheduler"
}

variable "chart_version" {
  description = "Chart version to install."
  type        = string
  default     = "0.35.1"
}

variable "additional_values" {
  description = "Additional values to pass to the helm chart."
  type        = list(string)
  default     = []
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

variable "topology_spread_constraints" {
  description = "Topology spread constraint types balanced by the RemovePodsViolatingTopologySpreadConstraint plugin. Add ScheduleAnyway to balance soft constraints too."
  type        = list(string)
  default     = ["DoNotSchedule"]

  validation {
    condition     = length(var.topology_spread_constraints) > 0 && length(distinct(var.topology_spread_constraints)) == length(var.topology_spread_constraints) && alltrue([for c in var.topology_spread_constraints : contains(["DoNotSchedule", "ScheduleAnyway"], c)])
    error_message = "Set at least one of DoNotSchedule and ScheduleAnyway, without duplicates."
  }
}

variable "node_fit" {
  description = "Evict a pod only when it fits on another node, through the nodeFit argument of the DefaultEvictor plugin."
  type        = bool
  default     = false
}

variable "max_pods_to_evict_per_node" {
  description = "Maximum number of pods evicted per node in each descheduler run. Null means no limit."
  type        = number
  default     = null

  validation {
    condition     = var.max_pods_to_evict_per_node == null || try(var.max_pods_to_evict_per_node >= 1 && floor(var.max_pods_to_evict_per_node) == var.max_pods_to_evict_per_node, false)
    error_message = "Set a whole number of at least 1, or null for no limit."
  }
}

variable "service_monitor_enabled" {
  description = "Enable Prometheus service monitor."
  type        = bool
  default     = false
}

variable "service_monitor_namespace" {
  description = "Service monitor namespace."
  type        = string
  default     = ""
}
