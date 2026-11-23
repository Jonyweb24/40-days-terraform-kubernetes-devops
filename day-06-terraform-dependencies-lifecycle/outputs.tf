output "project_identifier" {
  description = "Project identifier"
  value       = local.project_identifier
}

output "deployment_tier" {
  description = "Deployment tier"
  value       = local.deployment_tier
}
output "network_file" {
  description = "Generated network configuration"
  value       = local_file.network_config.filename
}

output "database_file" {
  description = "Generated database configuration"
  value       = local_file.database_config.filename
}

output "application_file" {
  description = "Generated application configuration"
  value       = local_file.application_config.filename

}

output "deployment_summary_file" {
  description = "Generated deployment summary"
  value       = local_file.deployment_summary.filename
}

output "release_file" {
  description = "Current release manifest"
  value       = local_file.release_manifest.filename
}

output "critical_config_file" {
  description = "Protected configuration file"
  value       = local_file.critical_config.filename
}
output "deployment_notes_filename" {
  description = "Manual notes file"
  value       = local_file.deployment_notes.filename
}

# Advanced 

output "deployment_tracker" {
  description = "Terraform deployment tracking data"
  value       = terraform_data.deployment_tracker.output
}
