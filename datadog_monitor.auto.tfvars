# all
notify_all = [
  "@slack-alert0",
  "@slack-alert-all",
]
# only alert
notify_is_alert = [
  "@slack-alert1",
  "@slack-alert-only",
]
notify_is_alert_recovery = []
# only warning
notify_is_warning = [
  "@slack-alert2",
  "@slack-warning-only",
]
notify_is_warning_recovery = []
notify_is_recovery = []
# only nodata
notify_is_no_data = [
  "@slack-alert3",
  "@slack-nodata-only",
]
notify_is_not_alert = []
notify_is_not_alert_recovery = []
notify_is_not_warning = []
notify_is_not_warning_recovery = []
# exclude recovery (alert & warning [& nodata if notify_no_data = "true"])
notify_is_not_recovery = [
  "@slack-alert4",
  "@slack-alert-not-recovery",
]
# exclude nodata (alert & warning & recovery)
notify_is_not_no_data = [
  "@slack-alert5",
  "@slack-alert-not-nodata",
]
