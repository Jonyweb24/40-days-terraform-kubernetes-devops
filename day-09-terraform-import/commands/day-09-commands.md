
# Day 09 - Terraform Import Commands

## Navigate

cd ~/devops-40-days/day-09-terraform-import

## Initialize

terraform init

## Format and Validate

terraform fmt
terraform validate

## Plan before import

terraform plan

## CLI Import

terraform import random_integer.legacy_port "15432,10000,20000"

## Import Block

terraform plan
terraform apply

## Inspect State

terraform state list
terraform state show random_integer.legacy_port
terraform state show random_integer.managed_port

## Check Outputs

terraform output

## Final Verification

terraform plan
