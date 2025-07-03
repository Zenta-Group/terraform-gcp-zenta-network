# [START vpc_firewall_create]

module "vpc_with_firewall_rules" {
  source  = "app.terraform.io/zentagroup/zenta-network/gcp"
  #version = "1.0.x"
  project                 = var.project_id # Replace this with your project ID in quotes
  name                    = "my-auto-mode-network"
  auto_create_subnetworks = true

  rules = [
    {
      name        = "allow-ssh"
      direction   = "INGRESS"
      priority    = 1000
      ranges      = ["0.0.0.0/0"]
      allow       = [{ protocol = "tcp", ports = ["80", "8080", "1000-2000"] }]
    }
  ]
}
# [END vpc_firewall_create]
