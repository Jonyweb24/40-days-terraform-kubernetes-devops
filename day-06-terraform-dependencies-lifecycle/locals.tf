
locals {

  project_identifier = "${var.project_name}-${var.environment}"

  deployment_tier = var.environment == "production" ? "HIGH-AVAILABILITY" : "STANDARD"

  network_name = "${local.project_identifier}-network"

  database_name = "${local.project_identifier}-database"

  application_name = "${local.project_identifier}-application"

}