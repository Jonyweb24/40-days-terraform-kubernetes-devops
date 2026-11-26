locals {
  project_identifier = lower(
    replace(var.project_name, " ", "-")
  )

  service_count = length(var.services)
  deployment_summary = join(
    ", ",
    keys(var.services)
  )

  deployment_message = "Deploying ${local.service_count} services in ${var.environment} environment"
}
