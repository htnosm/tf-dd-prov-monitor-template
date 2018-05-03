# Variables
variable "datadog_api_key" {}
variable "datadog_app_key" {}

# Configure the Datadog provider
provider "datadog" {
  version = "~> 1.0"
  api_key = "${var.datadog_api_key}"
  app_key = "${var.datadog_app_key}"
}
