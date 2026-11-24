
# Day 08 - Terraform Commands

## Navigate
cd ~/devops-40-days/day-06-terraform-dependencies-lifecycle

## Verify
terraform version
terraform state list
terraform fmt
terraform validate
terraform plan

## Backup
mkdir -p backups
terraform state pull > backups/day-08-state-backup.json

## Inspect Backup
python3 -m json.tool backups/day-08-state-backup.json | less

## Inspect Metadata
python3 -c 'import json; d=json.load(open("backups/day-08-state-backup.json")); print(d.get("lineage"),d.get("serial"))'

## Create Drift
cp network-config.txt /tmp/network-config-before-drift.txt
nano network-config.txt

## Detect Drift
terraform plan

## Reconcile Drift
terraform apply

## Refresh-only
terraform plan -refresh-only
terraform apply -refresh-only

## Final Verification
terraform plan
terraform state list