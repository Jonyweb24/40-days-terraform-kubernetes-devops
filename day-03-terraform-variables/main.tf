
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

# Resource 1: Project summary
resource "local_file" "project_summary" {
  filename = "${path.module}/project-summary.txt"

  content = <<-EOT
    PROJECT SUMMARY

    Project Name: ${var.project_name}
    Environment: ${var.environment}
    Application: ${var.application_name}

    Application Port: ${var.application_port}
    Monitoring Enabled: ${var.enable_monitoring}
  EOT
}

# Resource 2: Deployment configuration
resource "local_file" "deployment_config" {
  filename = "${path.module}/deployment-config.txt"

  content = <<-EOT
    DEPLOYMENT CONFIGURATION

    Project: ${var.project_name}
    Environment: ${var.environment}

    Application Name: ${var.application.name}
    Application Version: ${var.application.version}
    Replicas: ${var.application.replicas}
    Monitoring: ${var.application.monitoring}
  EOT
}

# Resource 3: Infrastructure details
resource "local_file" "infrastructure_details" {
  filename = "${path.module}/infrastructure-details.txt"

  content = <<-EOT
    INFRASTRUCTURE DETAILS

    Project: ${var.project_name}

    Services:
    ${join("\n", var.services)}

    Service Ports:
    ${jsonencode(var.service_ports)}
  EOT
}
