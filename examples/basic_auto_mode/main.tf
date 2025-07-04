# [START vpc_auto_create]

module "vpc_auto_mode" {
  source  = "app.terraform.io/zentagroup/zenta-network/gcp"

  project_id   = var.project_id
  network_name = "${var.application_name}-${var.environment}-vpc"
  auto_create_subnetworks = true
}
# [END vpc_auto_create]