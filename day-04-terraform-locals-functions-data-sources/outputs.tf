output "project_environment" {
  description = "Project and environment name"
  value       = local.project_environment
}

output "deployment_id" {
  description = "Generated deployment ID"
  value       = local.deployment_id
}

output "total_services" {
  description = "Total number of services"
  value       = local.total_services
}

output "service_names" {
  description = "Generated service names"
  value       = local.service_names
}

output "monitoring_status" {
  description = "Monitoring status"
  value       = local.monitoring_status
}

output "template_content_length" {
  description = "Number of characters in the source template"
  value       = length(data.local_file.deployment_template.content)
}

output "generated_files" {
  description = "Generated file paths"
  value = [
    local_file.deployment_config.filename,
    local_file.project_summary.filename
  ]
}