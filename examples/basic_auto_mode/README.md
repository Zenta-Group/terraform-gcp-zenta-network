# Auto mode network

Este ejemplo configura una red VPC simple en modo automático dentro de un proyecto.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | El ID del proyecto para alojar la red | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| auto | El valor de la configuración del modo automático |
| network\_name | El nombre de la VPC que se está creando |
| network\_self\_link | El URI de la VPC que se está creando |
| project\_id | ID del proyecto VPC |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->