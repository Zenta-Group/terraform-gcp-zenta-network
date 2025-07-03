# [START vpc_auto_create]

module "zenta-network" {
  source  = "app.terraform.io/zentagroup/zenta-network/gcp"
  #version = "1.0.x"
  project                 = var.project_id # Replace this with your project ID in quotes
  name                    = "my-auto-mode-network"
  auto_create_subnetworks = true
}
# [END vpc_auto_create]