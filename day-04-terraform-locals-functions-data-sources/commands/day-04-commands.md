
# Navigate to Day 04
cd day-04-terraform-locals-functions-data-sources

# Format
terraform fmt -recursive

# Initialize
terraform init

# Validate
terraform validate

# Plan
terraform plan

# Apply
terraform apply

# Check outputs
terraform output

# Inspect generated files
cat deployment-config.txt
cat project-summary.txt

# Terraform console
terraform console

# State
terraform state list
terraform state show data.local_file.deployment_template

# Inspect changes
terraform plan