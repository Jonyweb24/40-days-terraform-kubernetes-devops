resource "local_file" "service_config" {

  filename = "${path.root}/generated/${var.service_name}-config.txt"

  content = <<-EOT
    SERVICE CONFIGURATION

    Project: ${var.project_name}

    Environment: ${var.environment}

    Service Name: ${var.service_name}

    Description: ${var.description}

    Port: ${var.service_port}

    Replicas: ${var.replicas}

    Status: ACTIVE
  EOT

}