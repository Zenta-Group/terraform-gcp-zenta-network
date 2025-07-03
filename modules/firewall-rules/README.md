# Módulo de Reglas de Firewall de Terraform

Este submódulo es parte del módulo `terraform-google-network`. Permite la creación y configuración de reglas de firewall para una red VPC en Google Cloud Platform.

Soporta la creación de:

- Reglas de firewall para controlar el tráfico de entrada y salida en la red VPC.

## Uso

El uso básico de este submódulo es el siguiente:

```hcl
module "firewall_rules" {
    source  = "./modules/firewall-rules"

    project_id   = "<ID DEL PROYECTO>"
    network_name = "ejemplo-vpc"

    rules = [
        {
            name        = "allow-ssh"
            direction   = "INGRESS"
            priority    = 1000
            ranges      = ["0.0.0.0/0"]
            allow       = [{ protocol = "tcp", ports = ["22"] }]
        },
        {
            name        = "allow-http"
            direction   = "INGRESS"
            priority    = 1000
            ranges      = ["0.0.0.0/0"]
            allow       = [{ protocol = "tcp", ports = ["80"] }]
        }
    ]
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Input

| Nombre | Descripción | Tipo | Predeterminado | Requerido |
|------|-------------|------|---------|:--------:|
| project\_id | El ID del proyecto donde se crearán las reglas de firewall | `string` | n/a | sí |
| network\_name | El nombre de la red VPC donde se aplicarán las reglas de firewall | `string` | n/a | sí |
| rules | Una lista de reglas de firewall a crear. Cada regla debe incluir `name`, `direction`, `priority`, `ranges`, y `allow` o `deny`. | `list(object)` | `[]` | no |

## Output

| Nombre | Descripción |
|------|-------------|
| firewall\_rules | Una lista de recursos de reglas de firewall creados |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->