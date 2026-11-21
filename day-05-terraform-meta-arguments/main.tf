terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~>2.5"
    }
  }

}

provider "local" {}

# Resources 1: Create multiple service inventory files using count

resource "local_file" "service_inventory" {
  count = length(var.services)

  filename = "count-${count.index}-${var.services[count.index]}.txt"

  content = <<-EOT
      SERVICE inventory
      
      Service Name: ${var.services[count.index]}

      Service Index: ${count.index}

      Project: ${var.project_name}

      Environment: ${var.environment}
    EOT
}

#Resource 2: Create service configuration files using for_each

resource "local_file" "service_port_config" {
  for_each = var.service_ports

  filename = "for-each-${each.key}.txt"

  content = <<-EOT
       SERVICE CONFIGURATION 

       Service Name: ${each.key}

       Service Port: ${each.value}

       Project: ${var.project_name}

       Environment: ${var.environment}
    EOT 

}
# Resource 3: Create monitoring file conditionally

resource "local_file" "monitoring_config" {
  count = var.enable_monitoring ? 1 : 0

  filename = "monitoring-config.txt"

  content = <<-EOT
       MONITORING CONFIGURATION 
       
       Monitoring: ENABLED

       Project: ${var.project_name}
       
       Environment: ${var.environment}

       Deployment Tier: ${local.deployment_tier}
    EOT
}

