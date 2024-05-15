output "namespace" {
  description = "Namespace where the descheduler is installed."
  value       = local.final_namespace
}

output "k8s_full_labels" {
  description = "Full set of labels applied to all resources."
  value       = local.k8s_full_labels
}
