terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~>2.5"
    }
  }
}

provider "local" {}

# Resource 1: Project information file
resource "local_file" "project_info" {
  filename = "${path.module}/project-info.txt"

  content = <<-EOT
    Project Name: DevOps Infrastructure
    Learning Day:02
    Tool: terraform

    Purpose:
    Learning HCL,Providers and Resources.
    EOT

}

# Resources 2: Deployment configuration

resource "local_file" "deployment_config" {
  filename = "${path.module}/deployment-config.txt"

  content = <<-EOT
    Application: DevOPs Deployment
    Environment: Development
    Deployment Tool: Terraform

    Container Runtime: Docker
    Orchestration: Kubernetes
  EOT
}

# Resource 3: Server information
resource "local_file" "server_details" {
  filename = "${path.module}/server-details.txt"

  content = <<-EOT
      Server Name: devops-local-server
      Operating System; Ubuntu
      Purpose: Terraform Practice
      Status: Learning Environment 
    EOT

}
#Dependecy example

resource "local_file" "deployment_summary" {
  filename = "${path.module}/deployment-summary.txt"

  content = <<-EOT
    Deployment Summary

    Project File:
    ${local_file.project_info.filename}

    Deployment Configuration:
    ${local_file.deployment_config.filename}

    Server Details:
    ${local_file.server_details.filename}
  EOT
}
resource "local_file" "another_project_info" {
  filename = "another.txt"
  content  = "Test"
}