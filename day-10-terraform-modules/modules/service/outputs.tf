output "service_file" {
  description = "Generated service configuration file"
  value       = local_file.service_config.filename
}

output "service_details" {
  description = "Service configuration details"

  value = {
    name        = var.service_name
    port        = var.service_port
    replicas    = var.replicas
    description = var.description
  }
}