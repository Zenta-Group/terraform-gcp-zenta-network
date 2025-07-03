# terraform-gcp-zenta-network

Este módulo de Terraform crea y configura una red VPC en Google Cloud Platform (GCP). Proporciona opciones para configurar subredes, reglas de firewall, rutas, y otras características avanzadas de redes.

## Requisitos

- Terraform >= 1.3
- Proveedor de Google Cloud >= 4.64, < 7

## Uso

```hcl
module "vpc" {
  source                                    = "./modules/vpc"
  network_name                              = "example-network"
  auto_create_subnetworks                   = false
  routing_mode                              = "GLOBAL"
  project_id                                = "my-project-id"
  description                               = "Example VPC"
  shared_vpc_host                           = false
  delete_default_internet_gateway_routes    = true
  mtu                                       = 1460
  enable_ipv6_ula                           = false
  internal_ipv6_range                       = null
  network_firewall_policy_enforcement_order = null
}
```

## Variables de Entrada

| Nombre                                | Tipo                                                                 | Descripción                                                                                                   | Valor por Defecto |
|---------------------------------------|----------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|-------------------|
| `project_id`                          | `string`                                                             | El ID del proyecto donde se creará esta VPC.                                                                 | N/A               |
| `network_name`                        | `string`                                                             | El nombre de la red que se está creando.                                                                     | N/A               |
| `routing_mode`                        | `string`                                                             | El modo de enrutamiento de la red (`GLOBAL` o `REGIONAL`).                                                   | `GLOBAL`          |
| `shared_vpc_host`                     | `bool`                                                               | Si es `true`, convierte este proyecto en un host de VPC compartida.                                          | `false`           |
| `subnets`                             | `list(object({...}))`                                                | Lista de subredes que se crearán.                                                                            | `[]`              |
| `firewall_rules`                      | `list(object({...}))`                                                | Reglas de firewall (DEPRECATED).                                                                             | `[]`              |
| `ingress_rules`                       | `list(object({...}))`                                                | Lista de reglas de entrada.                                                                                  | `[]`              |
| `egress_rules`                        | `list(object({...}))`                                                | Lista de reglas de salida.                                                                                   | `[]`              |
| `delete_default_internet_gateway_routes` | `bool`                                                             | Si se establece, elimina todas las rutas predeterminadas del gateway de internet.                            | `false`           |
| `mtu`                                 | `number`                                                             | El MTU de la red.                                                                                            | `0`               |
| `enable_ipv6_ula`                     | `bool`                                                               | Habilita IPv6 ULA.                                                                                           | `false`           |
| `internal_ipv6_range`                 | `string`                                                             | Rango IPv6 interno opcional.                                                                                 | `null`            |
| `network_firewall_policy_enforcement_order` | `string`                                                         | Orden de evaluación de reglas de firewall (`BEFORE_CLASSIC_FIREWALL` o `AFTER_CLASSIC_FIREWALL`).            | `null`            |

## Salidas

| Nombre                  | Descripción                                                                                     |
|-------------------------|-------------------------------------------------------------------------------------------------|
| `network`               | La red creada.                                                                                 |
| `subnets`               | Mapa de subredes creadas.                                                                       |
| `network_name`          | Nombre de la VPC creada.                                                                        |
| `network_id`            | ID de la VPC creada.                                                                            |
| `network_self_link`     | URI de la VPC creada.                                                                           |
| `project_id`            | ID del proyecto de la VPC.                                                                      |
| `subnets_names`         | Nombres de las subredes creadas.                                                                |
| `subnets_ids`           | IDs de las subredes creadas.                                                                    |
| `subnets_ips`           | IPs y CIDRs de las subredes creadas.                                                            |
| `subnets_self_links`    | Self-links de las subredes creadas.                                                             |
| `subnets_regions`       | Regiones donde se crearán las subredes.                                                         |
| `subnets_private_access`| Si las subredes tendrán acceso a las API de Google sin una IP pública.                          |
| `subnets_flow_logs`     | Si las subredes tendrán habilitados los registros de flujo de VPC.                              |
| `subnets_secondary_ranges` | Rangos secundarios asociados con estas subredes.                                            |
| `route_names`           | Nombres de las rutas asociadas con esta VPC.                                                   |

## Notas

- Este módulo está basado en las mejores prácticas de Google Cloud para la configuración de redes.
- Asegúrate de revisar las configuraciones predeterminadas y ajustarlas según tus necesidades.

## Licencia

Este módulo está licenciado bajo la Licencia Apache 2.0. Consulta el archivo `LICENSE` para más detalles.
