terraform {
  required_version = ">= 1.5.0"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.9"
    }
  }
}

provider "random" {}

# Resource 1 - Existing resource imported using CLI

resource "random_integer" "legacy_port" {
  min = 10000
  max = 20000
}

# Resource 2- Existing resource imported using import block

resource "random_integer" "managed_port" {

  min = 10000
  max = 20000
}

output "legacy_port_value" {
  value = random_integer.legacy_port.result
}

output "managed_port_value" {
  value = random_integer.managed_port.result
}