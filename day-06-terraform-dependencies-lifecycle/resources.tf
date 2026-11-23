# Resource 1 - Network Configuration
resource "local_file" "network_config" {
  filename = "${path.module}/network_config.txt"

  content = <<-EOT
    NETWORK CONFIGURATION

    Project: ${local.project_identifier}

    Network Name: ${local.network_name}

    Environment: ${var.environment}

    Status: Ready
  EOT
}

# Resource 2 - Database Configuration
resource "local_file" "database_config" {
  filename = "${path.module}/database-config.txt"

  content = <<-EOT
    DATABASE CONFIGURATION

    Project: ${local.project_identifier}

    Database Name: ${local.database_name}

    Environment: ${var.environment}

    Status: READY
  EOT
}

# Resource 3 - Application Configuration
resource "local_file" "application_config" {
  filename = "${path.module}/application-configuration.txt"

  content = <<-EOT
    APPLICATION CONFIGURATION

    Application: ${local.application_name}

    Project: ${local.project_identifier}

    Network file: ${local_file.network_config.filename}

    Database File: ${local_file.database_config.filename}

    Deployment Tier: ${local.deployment_tier}

    Status: READY
  EOT
}

# Resource 4 - Deployment Summary
resource "local_file" "deployment_summary" {
  filename = "${path.module}/deployment-summary.txt"

  content = <<-EOT
    DEPLOYMENT SUMMARY

    Project: ${local.project_identifier}

    Environment: ${var.environment}

    Application: ${local.application_name}

    Deployment Status: COMPLETED
  EOT

  depends_on = [
    local_file.application_config,
    local_file.database_config
  ]
}

# Resource 5 - Release Manifest
resource "local_file" "release_manifest" {
  filename = "${path.module}/${var.release_filename}"

  content = <<-EOT
    RELEASE MANIFEST

    Project: ${var.project_name}

    Release Version: ${var.release_version}

    Environment: ${var.environment}

    Deployment Tier: ${local.deployment_tier}
  EOT

  lifecycle {
    create_before_destroy = true
  }
}

# Resource 6 - Critical Configuration
resource "local_file" "critical_config" {
  filename = "${path.module}/critical-config.txt"

  content = <<-EOT
    CRITICAL CONFIGURATION

    Project: ${var.project_name}

    Environment: ${var.environment}

    Protection: ENABLED

    Warning: Do not delete this configuration accidentally.
  EOT

  lifecycle {
    prevent_destroy = true
  }
}

# Resource 7 - Manual Notes
resource "local_file" "manual_notes" {
  filename = "${path.module}/manual-notes.txt"

  content = var.manual_note_content

  lifecycle {
    ignore_changes = [
      content
    ]
  }
}

# Advanced 

resource "terraform_data" "deployment_tracker" {
  input = {
    project     = var.project_name
    environment = var.environment
    version     = var.release_version
  }

  triggers_replace = [
    var.release_version
  ]
}