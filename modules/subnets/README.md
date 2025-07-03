# Módulo de Subredes de Terraform

Este submódulo es parte del módulo `terraform-google-network`. Permite la creación y configuración de subredes personalizadas dentro de una red VPC en Google Cloud Platform.

Soporta la creación de:

- Subredes personalizadas con rangos de IP específicos.

## Uso

El uso básico de este submódulo es el siguiente:

```hcl
module "subnets" {
    source  = "./modules/subnets"

    project_id   = "<ID DEL PROYECTO>"
    network_name = "ejemplo-vpc"

    subnets = [
        {
            name               = "subnet-1"
            ip_cidr_range      = "10.0.1.0/24"
            region             = "us-central1"
            private_ip_google_access = true
        },
        {
            name               = "subnet-2"
            ip_cidr_range      = "10.0.2.0/24"
            region             = "us-east1"
            private_ip_google_access = false
        }
    ]
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Input

| Nombre | Descripción | Tipo | Predeterminado | Requerido |
|------|-------------|------|---------|:--------:|
| project\_id | El ID del proyecto donde se crearán las subredes | `string` | n/a | sí |
| network\_name | El nombre de la red VPC donde se crearán las subredes | `string` | n/a | sí |
| subnets | Una lista de subredes a crear. Cada subred debe incluir `name`, `ip_cidr_range`, `region`, y opcionalmente `private_ip_google_access`. | `list(object)` | `[]` | no |

## Output

| Nombre | Descripción |
|------|-------------|
| subnets | Una lista de recursos de subredes creados |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->