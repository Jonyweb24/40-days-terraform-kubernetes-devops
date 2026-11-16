
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }

  required_version = ">= 1.5.0"
}

provider "local" {}

resource "local_file" "devops_learning" {
  filename = "${path.module}/hello-devops.txt"

  content = <<-EOT
    Welcome to 40 Days DevOps Learning!

    Day: 01
    Topic: Terraform Introduction

    I am learning Infrastructure as Code.
    Terraform helps automate infrastructure.
  EOT
}
