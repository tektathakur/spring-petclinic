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

provider "kubernetes" {}

module "gke_auth" {
  source               = "terraform-google-modules/kubernetes-engine/google//modules/auth"
  project_id           = "dotted-byway-411905"
  cluster_name         = "primary"
  location             = "us-central1-a"
}

resource "local_file" "kubeconfig" {
  content  = module.gke_auth.kubeconfig_raw
  filename = "kubeconfig"
}

module "k8s-workload" {
  source = "./modules/k8s-workload"
}
