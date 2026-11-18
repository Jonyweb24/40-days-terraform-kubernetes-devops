
# Day 03 — Terraform Commands

## Project
cd ~/devops-40-days/day-03-terraform-variables

## Format
terraform fmt -recursive
terraform fmt -check -recursive

## Initialize
terraform init
terraform providers

## Validate
terraform validate

## Plan
terraform plan

## Apply
terraform apply

## Override variable
terraform plan -var="environment=testing"

## Use another variable file
terraform plan -var-file="production.tfvars"

## Environment variable
export TF_VAR_environment="testing"
terraform plan
unset TF_VAR_environment

## Outputs
terraform output
terraform output project_name
terraform output -json

## State
terraform state list
terraform show

## Cleanup
terraform destroy
