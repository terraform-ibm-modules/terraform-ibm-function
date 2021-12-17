#####################################################
# Cloud-Function Configuration Example
# Copyright 2020 IBM
#####################################################

/****************************************************
Example Usage

package_name = "cf-package"
action_name = "cf-action"
action_exec = [{
  main = "main"
  kind = "python:3.7"
  code_path = "action.zip"
}]
namespace_name = "cf-namespace"
resource_group_name = "default"
trigger_name = "cf-trigger"
trigger_feed = [{
    name = "/whisk.system/alarms/alarm"
    parameters = <<EOF
    [
      {
        "key" : "cron",
        "value" : "* * * * *"
      }
    ]
    EOF
  }]
rule_name  = "cf-rule"
******************************************************/

is_new_package = true
package_name   = "cf-package"
action_name    = "cf-action"
action_exec = [{
  kind      = "nodejs:10"
  code_path = "nodeaction.zip"
}]
namespace_name      = "cf-namespace"
resource_group_name = "default"
trigger_name        = "cf-trigger"
trigger_feed = [{
  name       = "/whisk.system/alarms/alarm"
  parameters = <<EOF
    [
      {
        "key" : "cron",
        "value" : "* * * * *"
      }
    ]
    EOF
}]
rule_name = "cf-rule"