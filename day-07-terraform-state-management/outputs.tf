output "generated_file_path" {
  description = "Path to the file created by Terraform"
  value       = local_file.deployment_note.filename
}

output "lab_summary" {
  description = "Summary of Day 7 lab configuration"
  value       = "${var.lab_topic} (${var.environment})"
}