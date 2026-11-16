
# Day 01 — Terraform Introduction

## 1. What is Infrastructure?
Infrastructure means the resources required to run an application:
- Servers
- Networks
- Storage
- Databases
- Load balancers
- Firewalls

## 2. What is IaC?
Infrastructure as Code means managing infrastructure
using configuration files instead of manual configuration.

Benefits:
- Automation
- Repeatability
- Version control
- Consistency
- Easier collaboration

## 3. What is Terraform?
Terraform is an Infrastructure as Code tool by HashiCorp.
It uses declarative configuration to manage infrastructure.

## 4. What is a Provider?
A provider connects Terraform to an external platform or API.

Examples:
- AWS
- Azure
- Kubernetes
- Local

## 5. What is a Resource?
A resource is an infrastructure object managed by Terraform.

Examples:
- AWS S3 bucket
- EC2 instance
- Security group
- Local file

## 6. Terraform Workflow
1. Write configuration
2. terraform init
3. terraform fmt
4. terraform validate
5. terraform plan
6. terraform apply

## 7. Terraform State
State tracks the resources managed by Terraform.
Never commit state files or secrets to GitHub.

## 8. Commands learned

terraform version
terraform fmt
terraform init
terraform validate
terraform plan
terraform apply
terraform show
terraform state list
terraform output
terraform destroy

## 9. Day 1 Use Case
Created a local text file using Terraform's local provider.

This was a safe local exercise, not an AWS deployment.

