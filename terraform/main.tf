terraform {
  backend "gcs" {
    bucket = "terraform-states-this"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

provider "kubernetes" {
  config_path = "/Users/anujkumarsingh/.kube/config"
}

/*module "k8s-workload" {
  source = "./modules/k8s-workload"
}*/
