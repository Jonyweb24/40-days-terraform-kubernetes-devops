# Day 07 - Command Reference

## Directory
cd ~/devops-40-days/day-06-terraform-dependencies-lifecycle

## Backup
terraform state pull > day-07-state-backup.json

## List
terraform state list

## Show
terraform state show local_file.critical_config

## Move
terraform state mv OLD_ADDRESS NEW_ADDRESS

## Inspect
terraform show

## Refresh-only
terraform plan -refresh-only
terraform apply -refresh-only

## Validation
terraform fmt
terraform validate
terraform plan