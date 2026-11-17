
# Day 02 — HCL, Providers and Resources

## 1. What is HCL?
HCL means HashiCorp Configuration Language.
Terraform uses HCL to define infrastructure.

## 2. Declarative Language
Declarative configuration defines the desired state.
Terraform decides how to achieve that state.

## 3. Provider
A provider connects Terraform with an external platform.

Examples:
- AWS
- Azure
- Kubernetes
- Local
- Docker

## 4. required_providers
Defines provider source and version constraints.

## 5. Provider Block
Configures the provider.

Example:
provider "local" {}

## 6. Resource
A resource represents an object managed by Terraform.

Syntax:
resource "TYPE" "NAME" {}

## 7. Resource Address
Format:
resource_type.resource_name

Example:
local_file.project_info

## 8. Arguments
Arguments configure a resource.

Example:
filename = "hello.txt"
content = "Hello DevOps"

## 9. Implicit Dependency
When one resource references another resource,
Terraform can determine the dependency automatically.

## 10. Terraform Workflow
terraform fmt
terraform init
terraform validate
terraform plan
terraform apply

## 11. State Commands
terraform state list
terraform state show
terraform show

## 12. Day 2 Practical
Created four local files using Terraform.
Practiced resource references and dependencies.
Practiced plan, apply and debugging.
