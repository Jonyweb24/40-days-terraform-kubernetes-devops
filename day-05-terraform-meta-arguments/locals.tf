locals {
  # Count total services
  total_services = length(var.services)

  # Create a readable service list
  service_summary = join(", ", var.services)

  # Determine deployment tier
  deployment_tier = var.environment == "production" ? "HIGH-AVAILABILITY" : "STANDARD"

  # Determine monitoring status
  monitoring_status = var.enable_monitoring ? "ENABLED" : "DISABLED"

  # Generate project identifier
  project_identifier = "${var.project_name}-${var.environment}"
}