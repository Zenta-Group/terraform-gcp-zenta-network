# Custom Mode Network Example

Este ejemplo configura una red VPC personalizada en modo manual dentro de un proyecto. Se definen subredes específicas con rangos de IP y regiones.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | El ID del proyecto para alojar la red | `string` | n/a | yes |
| network\_name | El nombre de la red VPC personalizada | `string` | n/a | yes |
| auto\_create\_subnetworks | Indica si las subredes deben crearse automáticamente | `bool` | `false` | no |
| subnets | Lista de subredes con configuraciones específicas | `list(object)` | n/a | yes |

### Subnet Object

Cada objeto de subred debe incluir los siguientes atributos:

- `subnet_name`: Nombre de la subred.
- `subnet_ip`: Rango CIDR de la subred.
- `subnet_region`: Región donde se creará la subred.

## Outputs

| Name | Description |
|------|-------------|
| network\_name | El nombre de la VPC que se está creando |
| network\_self\_link | El URI de la VPC que se está creando |
| subnets | Lista de subredes creadas con sus detalles |
| project\_id | ID del proyecto VPC |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Ejemplo de Configuración

```terraform
module "vpc_with_subnets" {
  source  = "app.terraform.io/zentagroup/zenta-network/gcp"

  project_id   = var.project_id
  network_name = "my-custom-vpc"
  auto_create_subnetworks = false

  subnets = [
    {
      subnet_name   = "subnet-us-east1"
      subnet_ip     = "10.0.1.0/24"
      subnet_region = "us-east1"
    },
    {
      subnet_name   = "subnet-us-west1"
      subnet_ip     = "10.0.2.0/24"
      subnet_region = "us-west1"
    },
    {
      subnet_name   = "subnet-eu-central1"
      subnet_ip     = "10.0.3.0/24"
      subnet_region = "eu-central1"
    },
    {
      subnet_name   = "subnet-asia-east1"
      subnet_ip     = "10.0.4.0/24"
      subnet_region = "asia-east1"
    }
  ]
}
```

## Cómo Usar

1. Navega al directorio del ejemplo:
   ```bash
   cd infra/terraform-gcp-zenta-network/examples/basic_custom_mode
   ```

2. Inicializa Terraform:
   ```bash
   terraform init
   ```

3. Aplica la configuración:
   ```bash
   terraform apply
   ```

Este ejemplo creará una red VPC personalizada con las subredes especificadas en el proyecto indicado.
