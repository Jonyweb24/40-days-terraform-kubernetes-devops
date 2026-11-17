
# Day 02 — Terraform Commands

## 1. Environment

pwd
ls -la
terraform version

## 2. Formatting

terraform fmt
terraform fmt -check

## 3. Initialization

terraform init
terraform providers

## 4. Validation

terraform validate

## 5. Planning

terraform plan
terraform plan -out=day2.tfplan
terraform show day2.tfplan

## 6. Apply

terraform apply

## 7. Resource Inspection

terraform state list
terraform state show local_file.project_info
terraform show

## 8. Dependency Graph

terraform graph

## 9. Debugging

terraform fmt
terraform validate
terraform plan

## 10. To show contents of all text file ( here * mark is called 'wildcard')

cat *

## 11. Cleanup

terraform destroy
