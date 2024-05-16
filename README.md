# Terraform Helm Descheduler

This module installs [Descheduler](https://github.com/kubernetes-sigs/descheduler/) using the official [Helm Chart](https://github.com/kubernetes-sigs/descheduler/tree/master/charts/descheduler) in a Kubernetes cluster.

In this module, we have created simple Terraform variables to easily configure some features of the Descheduler. For example, you can filter the monitored nodes by labels, using the most used syntax for selector labels and you can turn on/off the low node utilization strategy. For the full list of available variables, please check the [Inputs](#inputs) section below.

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.0 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_values"></a> [additional\_values](#input\_additional\_values) | Additional values to pass to the helm chart. | `list(string)` | `[]` | no |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | Chart version to install. | `string` | `"0.29.0"` | no |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Create namespace for the ingress controller. If false, the namespace must be created before using this module. | `bool` | `true` | no |
| <a name="input_helm_release_name"></a> [helm\_release\_name](#input\_helm\_release\_name) | Name of the helm release. | `string` | `"descheduler"` | no |
| <a name="input_k8s_additional_labels"></a> [k8s\_additional\_labels](#input\_k8s\_additional\_labels) | Set of additional labels to apply to all resources. | `map(string)` | `{}` | no |
| <a name="input_k8s_labels"></a> [k8s\_labels](#input\_k8s\_labels) | Set of labels to apply to all resources. | `map(string)` | <pre>{<br>  "managed-by": "terraform"<br>}</pre> | no |
| <a name="input_low_node_utilization_enabled"></a> [low\_node\_utilization\_enabled](#input\_low\_node\_utilization\_enabled) | Enable low node utilization descheduler strategy. | `bool` | `true` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace to install the descheduler. | `string` | `"descheduler"` | no |
| <a name="input_node_selector_labels"></a> [node\_selector\_labels](#input\_node\_selector\_labels) | Node selector labels used by descheduler for limit pod eviction in selected nodes. | `map(string)` | `{}` | no |
| <a name="input_service_monitor_enabled"></a> [service\_monitor\_enabled](#input\_service\_monitor\_enabled) | Enable Prometheus service monitor. | `bool` | `false` | no |
| <a name="input_service_monitor_namespace"></a> [service\_monitor\_namespace](#input\_service\_monitor\_namespace) | Service monitor namespace. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_k8s_full_labels"></a> [k8s\_full\_labels](#output\_k8s\_full\_labels) | Full set of labels applied to all resources. |
| <a name="output_namespace"></a> [namespace](#output\_namespace) | Namespace where the descheduler is installed. |

## Resources

| Name | Type |
|------|------|
| [helm_release.this](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace_v1.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace_v1) | resource |
| [kubernetes_namespace_v1.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/namespace_v1) | data source |

## Modules

No modules.


<!-- END_TF_DOCS -->
