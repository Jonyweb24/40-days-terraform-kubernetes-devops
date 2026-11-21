output "project_identifier" {
  description = "Project and environment identifier"
  value       = local.project_identifier
}

output "deployment_tier" {
  description = "Deployment tier based on environment"
  value       = local.deployment_tier
}

output "total_services" {
  description = "Total number of services"
  value       = local.total_services
}

output "service_inventory_files" {
  description = "Files created using count"
  value       = local_file.service_inventory[*].filename
}

output "service_port_files" {
  description = "Files created using for_each"
  value = {
    for service, config in local_file.service_port_config :
    service => config.filename
  }
}

output "monitoring_status" {
  description = "Monitoring status"
  value       = local.monitoring_status
}

output "monitoring_file" {
  description = "Monitoring file path or disabled status"

  value = var.enable_monitoring ? (
    local_file.monitoring_config[0].filename
  ) : "Monitoring disabled"
}