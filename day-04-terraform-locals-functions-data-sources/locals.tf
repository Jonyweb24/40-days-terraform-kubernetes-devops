locals {
  # Project and environment naming
  project_environment = "${var.project_name}-${var.environment}"

  # Convert project name to uppercase
  project_name_upper = upper(var.project_name)
  # Convert environment to uppercase
  environment_upper = upper(var.environment)

  # Generate service names
  service_names = [
    for service in var.services :
    "${local.project_environment}-${service}"
  ]

  # Count total services
  total_services = length(var.services)

  # Join all services into one string
  services_text = join(", ", var.services)

  # Generate a deployment identifier

  deployment_id = format(
    "%s-%s-v%s",
    var.project_name,
    var.environment,
    var.application_version
  )

  # Generate service name

  service_name = [
    for service in var.services :
    "${local.project_environment}-${service}"
  ]
  # Monitoring status
  monitoring_status = var.enable_monitoring ? "ENABLED" : "DISABLED"

  # Generate a simple project description
  project_description = format(
    "%s project running in %s environment",
    title(var.project_name),
    title(var.environment)
  )
}
