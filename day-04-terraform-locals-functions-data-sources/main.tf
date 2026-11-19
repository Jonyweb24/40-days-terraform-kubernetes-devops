
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "local" {}

resource "local_file" "deployment_config" {
  filename = "${path.module}/deployment-config.txt"

  content = replace(
    replace(
      replace(
        replace(
          replace(
            replace(
              replace(
                replace(
                  data.local_file.deployment_template.content,
                  "{{PROJECT_NAME}}",
                  local.project_name_upper
                ),
                "{{ENVIRONMENT}}",
                local.environment_upper
              ),
              "{{DEPLOYMENT_ID}}",
              local.deployment_id
            ),
            "{{APP_VERSION}}",
            var.application_version
          ),
          "{{APP_PORT}}",
          tostring(var.application_port)
        ),
        "{{MONITORING_STATUS}}",
        local.monitoring_status
      ),
      "{{TOTAL_SERVICES}}",
      tostring(local.total_services)
    ),
    "{{SERVICES}}",
    local.services_text
  )
}

resource "local_file" "project_summary" {
  filename = "${path.module}/project-summary.txt"

  content = <<-EOT
PROJECT SUMMARY
================

Project: ${local.project_description}
Project Name: ${var.project_name}
Environment: ${var.environment}
Deployment ID: ${local.deployment_id}
Total Services: ${local.total_services}

Service Names:
${join("\n", local.service_name)}

Monitoring: ${local.monitoring_status}
EOT
}
