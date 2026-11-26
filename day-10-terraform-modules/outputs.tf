output "project_identifier" {
  description = "Unique project identifier"
  value       = local.project_identifier
}

output "service_count" {
  description = "Total number of services"
  value       = local.service_count
}

output "deployment_message" {
  description = "Deployment summary"
  value       = local.deployment_message
}

output "service_files" {
  description = "Generated configuration files"

  value = {
    for name, service in module.services :
    name => service.service_file
  }
}

output "service_details" {
  description = "Details returned by child modules"

  value = {
    for name, service in module.services :
    name => service.service_details
  }
}