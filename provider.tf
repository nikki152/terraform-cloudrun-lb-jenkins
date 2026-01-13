terraform {
  required_version = ">= 1.3.0"
 
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
 
  backend "gcs" {
    bucket  = "bucket88999"
    prefix  = "cloudrun-lb/practice"
  }
}
 
provider "google" {
  project = var.project_id
  region  = var.region
}
