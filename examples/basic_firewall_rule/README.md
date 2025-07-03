# Ejemplo: Reglas Básicas de Firewall

Este ejemplo demuestra cómo usar el módulo de reglas de firewall para crear una regla básica que permita el tráfico SSH en una red VPC.

## Uso

```hcl
module "firewall_rules" {
  source  = "../../modules/firewall-rules"

  project_id   = var.project_id
  network_name = var.network_name

  rules = [
    {
      name        = "allow-ssh"
      direction   = "INGRESS"
      priority    = 1000
      ranges      = ["0.0.0.0/0"]
      allow       = [{ protocol = "tcp", ports = ["22"] }]
    }
  ]
}
```

## Variables

- `project_id`: El ID del proyecto donde se aplicarán las reglas de firewall.
- `network_name`: El nombre de la red VPC donde se aplicarán las reglas de firewall.
- `rules`: Lista de reglas de firewall a crear.

## Outputs

- `firewall_rules`: Lista de reglas de firewall creadas.

## Requisitos Previos

- Una red VPC existente en el proyecto especificado.
- Configuración de credenciales para Google Cloud.

## Ejecución

1. Inicializa el directorio de Terraform:
   ```bash
   terraform init
   ```

2. Aplica la configuración:
   ```bash
   terraform apply
   ```

3. Verifica las reglas de firewall creadas en la consola de Google Cloud.

