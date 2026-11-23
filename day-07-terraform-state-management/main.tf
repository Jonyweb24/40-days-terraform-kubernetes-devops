terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "day07_lab_note" {
  filename = "${path.module}/${var.output_filename}"
  content  = "Topic: ${var.lab_topic}\nEnvironment: ${var.environment}\n"
}