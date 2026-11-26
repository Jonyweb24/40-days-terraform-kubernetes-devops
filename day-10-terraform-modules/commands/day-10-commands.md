# Day 10 Commands

## Create Project
mkdir -p day-10-terraform-modules

## Create Directories
mkdir -p modules/service
mkdir -p notes commands generated

## Format
terraform fmt -recursive

## Initialize
terraform init

## Validate
terraform validate

## Plan
terraform plan

## Apply
terraform apply

## Outputs
terraform output
terraform output service_files
terraform output service_details

## Check Generated Files
ls -l generated/
cat generated/frontend-config.txt
cat generated/backend-config.txt
cat generated/database-config.txt

## State
terraform state list
terraform state show 'module.services["backend"].local_file.service_config'