# Day 07 - Terraform State Management

## 1. What is Terraform State?

Terraform State tracks the relationship between
Terraform configuration and real infrastructure.

## 2. Why State is Important?

- Tracks managed resources
- Stores resource attributes
- Helps Terraform calculate changes
- Maintains resource identity

## 3. Important State Commands

### List resources
terraform state list

### Inspect a resource
terraform state show local_file.critical_config

### Move resource address
terraform state mv OLD_ADDRESS NEW_ADDRESS

### Remove resource from State
terraform state rm RESOURCE_ADDRESS

### Pull State snapshot
terraform state pull

## 4. Refresh-only

Preview:
terraform plan -refresh-only

Apply:
terraform apply -refresh-only

## 5. Important Safety Rules

- Never commit terraform.tfstate.
- Never commit State backups.
- Take a backup before State operations.
- Never run state rm without understanding its impact.
- Never use state push casually.
- Use remote backend for team environments.