# Módulo VPC de Terraform

Este submódulo es parte del módulo `terraform-google-network`. Crea una red VPC y, opcionalmente, la habilita como un proyecto host de VPC compartida.

Soporta la creación de:

- Una red VPC
- Opcionalmente, habilitar la red como un host de VPC compartida

## Uso

El uso básico de este submódulo es el siguiente:

```hcl
module "vpc" {
    source  = "terraform-google-modules/network/google//modules/vpc"
    version = "~> 11.1"

    project_id   = "<ID DEL PROYECTO>"
    network_name = "ejemplo-vpc"

    shared_vpc_host = false
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Input

| Nombre | Descripción | Tipo | Predeterminado | Requerido |
|------|-------------|------|---------|:--------:|
| auto\_create\_subnetworks | Cuando se establece en verdadero, la red se crea en 'modo de subred automática' y creará una subred para cada región automáticamente en el rango de direcciones 10.128.0.0/9. Cuando se establece en falso, la red se crea en 'modo de subred personalizada' para que el usuario pueda conectar explícitamente los recursos de la subred. | `bool` | `false` | no |
| bgp\_always\_compare\_med | Si se establece en verdadero, el Cloud Router usará los valores MED del par incluso si las rutas AS difieren. El valor predeterminado es falso. | `bool` | `false` | no |
| bgp\_best\_path\_selection\_mode | Especifica el modo de selección de la mejor ruta BGP. Los valores válidos son `STANDARD` o `LEGACY`. El valor predeterminado es `LEGACY`. | `string` | `"LEGACY"` | no |
| bgp\_inter\_region\_cost | Especifica el modo de costo entre regiones BGP. Los valores válidos son `DEFAULT` o `ADD_COST_TO_MED`. | `string` | `null` | no |
| delete\_default\_internet\_gateway\_routes | Si se establece, asegúrese de que todas las rutas dentro de la red especificada cuyos nombres comiencen con 'default-route' y con un próximo salto de 'default-internet-gateway' se eliminen | `bool` | `false` | no |
| description | Una descripción opcional de este recurso. El recurso debe recrearse para modificar este campo. | `string` | `""` | no |
| enable\_ipv6\_ula | IPv6 ULA habilitado, ¡este es un cambio permanente y no se puede deshacer! (predeterminado 'false') | `bool` | `false` | no |
| internal\_ipv6\_range | Al habilitar IPv6 ULA, opcionalmente, especifique un /48 de fd20::/20 (predeterminado nulo) | `string` | `null` | no |
| mtu | El MTU de la red (si se establece en 0, significa que el MTU no está establecido; el valor predeterminado es '1460'). Valores recomendados: 1460 (predeterminado por razones históricas), 1500 (predeterminado de Internet) u 8896 (para paquetes Jumbo). Se permiten todos los valores en el rango de 1300 a 8896, inclusive. | `number` | `0` | no |
| network\_firewall\_policy\_enforcement\_order | Establece el orden en que se evalúan las reglas de firewall y las políticas de firewall. Los valores válidos son `BEFORE_CLASSIC_FIREWALL` y `AFTER_CLASSIC_FIREWALL`. (el valor predeterminado es nulo o equivalente a `AFTER_CLASSIC_FIREWALL`) | `string` | `null` | no |
| network\_name | El nombre de la red que se está creando | `string` | n/a | sí |
| network\_profile | "Una URL completa o parcial del perfil de red para aplicar a esta red.<br>Este campo solo se puede establecer en el momento de la creación del recurso. Por ejemplo, las<br>siguientes son URL válidas:<br>  * https://www.googleapis.com/compute/beta/projects/{projectId}/global/networkProfiles/{network_profile_name}<br>  * projects/{projectId}/global/networkProfiles/{network\_profile_name} | `string` | `null` | no |
| project\_id | El ID del proyecto donde se creará esta VPC | `string` | n/a | sí |
| routing\_mode | El modo de enrutamiento de la red (predeterminado 'GLOBAL') | `string` | `"GLOBAL"` | no |
| shared\_vpc\_host | Convierte este proyecto en un host de VPC compartida si es 'verdadero' (predeterminado 'falso') | `bool` | `false` | no |

## Output

| Nombre | Descripción |
|------|-------------|
| network | El recurso VPC que se está creando |
| network\_id | El ID de la VPC que se está creando |
| network\_name | El nombre de la VPC que se está creando |
| network\_self\_link | El URI de la VPC que se está creando |
| project\_id | ID del proyecto VPC |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->