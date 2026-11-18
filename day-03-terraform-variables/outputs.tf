output "project_name" {
  description = "Configured project name"
  value       = var.project_name
}

output "environment" {
  description = "Selected environment"
  value       = var.environment
}


output "application_port" {
  description = "Application port"
  value       = var.application_port
}
output "services" {
  description = "Configured application services"
  value       = var.services
}

output "service_ports" {
  description = "Service port monitoring"
  value       = var.service_ports
}

output "monitoring_status" {
  description = "Whether monitoring is enabled"
  value       = var.enable_monitoring
}

output "generated_files" {
  description = "Generated local configuration files"

  value = [
    local_file.project_summary.filename,
    local_file.deployment_config.filename,
    local_file.infrastructure_details.filename
  ]
}