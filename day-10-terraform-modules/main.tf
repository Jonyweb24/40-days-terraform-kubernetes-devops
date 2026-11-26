terraform {
  required_version = ">= 1.5.0"

  required_providers {

    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "local" {}

module "services" {

  source = "./modules/service"

  for_each = var.services

  project_name = var.project_name

  environment = var.environment

  service_name = each.key

  service_port = each.value.port

  replicas = each.value.replicas

  description = each.value.description

}