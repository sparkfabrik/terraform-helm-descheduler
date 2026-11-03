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
  description = "Topology spread constraint types balanced by the descheduler."
  type        = list(string)
  default     = ["DoNotSchedule", "ScheduleAnyway"]
}

variable "node_fit" {
  description = "Evict a pod only when it fits on another node."
  type        = bool
  default     = true
}

variable "max_pods_to_evict_per_node" {
  description = "Maximum number of pods evicted per node in each descheduler run."
  type        = number
  default     = 1
}
