data "local_file" "deployment_template" {
  filename = "${path.module}/templates/deployment-template.txt"
}