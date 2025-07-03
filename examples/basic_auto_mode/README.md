# Auto Mode Network Example

Este ejemplo configura una red VPC en modo automático dentro de un proyecto. Las subredes se crean automáticamente en todas las regiones.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | El ID del proyecto para alojar la red | `string` | n/a | yes |
| network\_name | El nombre de la red VPC en modo automático | `string` | n/a | yes |
| auto\_create\_subnetworks | Indica si las subredes deben crearse automáticamente | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| network\_name | El nombre de la VPC que se está creando |
| network\_self\_link | El URI de la VPC que se está creando |
| project\_id | ID del proyecto VPC |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Ejemplo de Configuración

```terraform
module "vpc_auto_mode" {
  source  = "app.terraform.io/zentagroup/zenta-network/gcp"

  project_id   = var.project_id
  network_name = "my-auto-vpc"
  auto_create_subnetworks = true
}
```

## Cómo Usar

1. Navega al directorio del ejemplo:
   ```bash
   cd infra/terraform-gcp-zenta-network/examples/basic_auto_mode
   ```

2. Inicializa Terraform:
   ```bash
   terraform init
   ```

3. Aplica la configuración:
   ```bash
   terraform apply
   ```

Este ejemplo creará una red VPC en modo automático en el proyecto indicado.