variable "notify_all" { type = "list" }
variable "notify_is_alert" { type = "list" }
variable "notify_is_alert_recovery" { type = "list" }
variable "notify_is_warning" { type = "list" }
variable "notify_is_warning_recovery" { type = "list" }
variable "notify_is_recovery" { type = "list" }
variable "notify_is_no_data" { type = "list" }
variable "notify_is_not_alert" { type = "list" }
variable "notify_is_not_alert_recovery" { type = "list" }
variable "notify_is_not_warning" { type = "list" }
variable "notify_is_not_warning_recovery" { type = "list" }
variable "notify_is_not_recovery" { type = "list" }
variable "notify_is_not_no_data" { type = "list" }

locals {
  notify_all_join = "${ length(var.notify_all) == 0 ? "" : join(" ", var.notify_all) }"
  notify_all = " ${local.notify_all_join} "
  # is
  notify_is_alert_join = "${ length(var.notify_is_alert) == 0 ? "" : join(" ", var.notify_is_alert) }"
  notify_is_alert = " {{#is_alert}} ${local.notify_is_alert_join} {{/is_alert}} "
  notify_is_alert_recovery_join = "${ length(var.notify_is_alert) == 0 ? "" : join(" ", var.notify_is_alert) }"
  notify_is_alert_recovery = " {{#is_alert_recovery}} ${local.notify_is_alert_recovery_join} {{/is_alert_recovery}} "
  notify_is_warning_join = "${ length(var.notify_is_warning) == 0 ? "" : join(" ", var.notify_is_warning) }"
  notify_is_warning = " {{#is_warning}} ${local.notify_is_warning_join} {{/is_warning}} "
  notify_is_warning_recovery_join = "${ length(var.notify_is_warning_recovery) == 0 ? "" : join(" ", var.notify_is_warning_recovery) }"
  notify_is_warning_recovery = " {{#is_warning_recovery}} ${local.notify_is_warning_recovery_join} {{/is_warning_recovery}} "
  notify_is_recovery_join = "${ length(var.notify_is_recovery) == 0 ? "" : join(" ", var.notify_is_recovery) }"
  notify_is_recovery = " {{#is_recovery}} ${local.notify_is_recovery_join} {{/is_recovery}} "
  notify_is_no_data_join = "${ length(var.notify_is_no_data) == 0 ? "" : join(" ", var.notify_is_no_data) }"
  notify_is_no_data = " {{#is_no_data}} ${local.notify_is_no_data_join} {{/is_no_data}} "
  # is not
  notify_is_not_alert_join = "${ length(var.notify_is_not_alert) == 0 ? "" : join(" ", var.notify_is_not_alert) }"
  notify_is_not_alert = " {{^is_alert}} ${local.notify_is_not_alert_join} {{/is_alert}} "
  notify_is_not_alert_recovery_join = "${ length(var.notify_is_not_alert) == 0 ? "" : join(" ", var.notify_is_not_alert) }"
  notify_is_not_alert_recovery = " {{^is_alert_recovery}} ${local.notify_is_not_alert_recovery_join} {{/is_alert_recovery}} "
  notify_is_not_warning_join = "${ length(var.notify_is_not_warning) == 0 ? "" : join(" ", var.notify_is_not_warning) }"
  notify_is_not_warning = " {{^is_warning}} ${local.notify_is_not_warning_join} {{/is_warning}} "
  notify_is_not_warning_recovery_join = "${ length(var.notify_is_not_warning_recovery) == 0 ? "" : join(" ", var.notify_is_not_warning_recovery) }"
  notify_is_not_warning_recovery = " {{^is_warning_recovery}} ${local.notify_is_not_warning_recovery_join} {{/is_warning_recovery}} "
  notify_is_not_recovery_join = "${ length(var.notify_is_not_recovery) == 0 ? "" : join(" ", var.notify_is_not_recovery) }"
  notify_is_not_recovery = " {{^is_recovery}} ${local.notify_is_not_recovery_join} {{/is_recovery}} "
  notify_is_not_no_data_join = "${ length(var.notify_is_not_no_data) == 0 ? "" : join(" ", var.notify_is_not_no_data) }"
  notify_is_not_no_data = " {{^is_no_data}} ${local.notify_is_not_no_data_join} {{/is_no_data}} "
}

data "template_file" "message" {
  template = "${file("./templates/message.tmpl")}"
}

data "template_file" "notify" {
  template = "${file("./templates/notify.tmpl")}"
  vars {
    notify_all = "${ local.notify_all_join == "" ? "" : local.notify_all }"
    # is
    notify_is_alert = "${ local.notify_is_alert_join == "" ? "" : local.notify_is_alert }"
    notify_is_alert_recovery = "${ local.notify_is_alert_recovery_join == "" ? "" : local.notify_is_alert_recovery }"
    notify_is_warning = "${ local.notify_is_warning_join == "" ? "" : local.notify_is_warning }"
    notify_is_warning_recovery = "${ local.notify_is_warning_recovery_join == "" ? "" : local.notify_is_warning_recovery }"
    notify_is_recovery = "${ local.notify_is_recovery_join == "" ? "" : local.notify_is_recovery }"
    notify_is_no_data = "${ local.notify_is_no_data_join == "" ? "" : local.notify_is_no_data }"
    # is not
    notify_is_not_alert = "${ local.notify_is_not_alert_join == "" ? "" : local.notify_is_not_alert }"
    notify_is_not_alert_recovery = "${ local.notify_is_not_alert_recovery_join == "" ? "" : local.notify_is_not_alert_recovery }"
    notify_is_not_warning = "${ local.notify_is_not_warning_join == "" ? "" : local.notify_is_not_warning }"
    notify_is_not_warning_recovery = "${ local.notify_is_not_warning_recovery_join == "" ? "" : local.notify_is_not_warning_recovery }"
    notify_is_not_recovery = "${ local.notify_is_not_recovery_join == "" ? "" : local.notify_is_not_recovery }"
    notify_is_not_no_data = "${ local.notify_is_not_no_data_join == "" ? "" : local.notify_is_not_no_data }"
  }
}
