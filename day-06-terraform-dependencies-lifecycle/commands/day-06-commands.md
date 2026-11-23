
# Navigate to Day 06
cd day-06-terraform-dependencies-lifecycle

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

# Outputs
terraform output

# Inspect resources
terraform state list

# Dependency graph
terraform graph

# Release replacement test
terraform plan -var="release_filename=release-v2.txt"

# Ignore changes test
terraform plan -var="manual_note_content=Updated deployment note"

# Prevent destroy test
terraform plan -destroy

# Inspect files
ls -la
