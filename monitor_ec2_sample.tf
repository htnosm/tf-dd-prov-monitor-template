resource "datadog_monitor" "ec2_cpuutilization" {
  type = "query alert"
  name = "[TEST] EC2 CPU Utilization"
  query = "max(last_5m):max:aws.ec2.cpuutilization{name:test-instance} by {host,name,region} > 99"
  message = "# [TEST] EC2 CPU Utilization\n${data.template_file.message.rendered}${data.template_file.notify.rendered}"
  escalation_message = "**Renotify**\n# [TEST] EC2 CPU Utilization\n${data.template_file.message.rendered}${data.template_file.notify.rendered}"
  notify_no_data = "false"
  new_host_delay = "300"
  evaluation_delay = "900"
  no_data_timeframe = "0"
  renotify_interval = "10"
  notify_audit = "false"
  timeout_h = "0"
  include_tags = "true"
  require_full_window = "false"
  locked = "false"
  thresholds {
    critical = 99.0
    warning = 80.0
    critical_recovery = 90.0
    warning_recovery = 70.0
  }
}

resource "datadog_monitor" "ec2_status_check_failed" {
  type = "query alert"
  name = "[TEST] EC2 StatusCheckFailed"
  query = "min(last_15m):max:aws.ec2.status_check_failed{name:test-instance} by {host,name,region} > 0"
  message = "# [TEST] EC2 StatusCheckFailed\n${data.template_file.message.rendered}${data.template_file.notify.rendered}"
  escalation_message = "**Renotify**\n# [hoge] EC2 StatusCheckFailed\n${data.template_file.message.rendered}${data.template_file.notify.rendered}"
  notify_no_data = "false"
  new_host_delay = "300"
  evaluation_delay = "900"
  no_data_timeframe = "0"
  renotify_interval = "10"
  notify_audit = "false"
  timeout_h = "0"
  include_tags = "true"
  require_full_window = "false"
  locked = "false"
  thresholds {
    critical = 0
  }
}
