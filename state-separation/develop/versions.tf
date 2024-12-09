terraform {
  required_version = "~> 1.10.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.32.0"
    }
  }
  backend "gcs" {
    bucket = "tf-state-sample-20241209-dev"
    prefix = "terraform/state/develop"
  }
}
