########################################################
# Cloud Function configuration
# Copyright 2020 IBM
########################################################

/****************************************************
Example Usage 

action_name = "cf-action"
action_exec = [{
  main = "main"
  kind = "python:3.7"
  code_path = "action.zip"
}]
namespace_name = "cf-namespace"
resource_group = "default"
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

action_name = "<action_name>"
action_exec = [{
  main = "main"
  kind = "python:3.7"
  code_path = "<action_zip>"
}]
namespace_name = "<namespace>"
resource_group = "default"
trigger_name = "<trigger_name>"
trigger_feed = <trigger_feed>
rule_name  = "<rule_name>"
