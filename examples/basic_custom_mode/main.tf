# [START vpc_custom_create]

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

# [END vpc_custom_create]