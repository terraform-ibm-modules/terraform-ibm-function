########################################################
# Package configuration
# Copyright 2020 IBM
########################################################

/****************************************************
Example Usage

resource_group_name = "default"

namespace_name = "function-namespace-name"
provision_namespace = true

trigger_name = "trigger-name"

feed = [{
  name = "/whisk.system/alarms/alarm"
  parameters = [
  {
    "key":"cron",
    "value":"* * * * *"
  }
  ]
}]

user_defined_parameters = <<EOF
  [
    {
      "key":"sample",
      "value":"sample"
    }
  ]
EOF

user_defined_annotations = <<EOF
  [
    {
      "key":"sample",
      "value":"sample"
    }
  ]
EOF

******************************************************/

resource_group_name = "<resource_group_name>"

namespace_name = "<namespace_name>"

rule_name = "<trigger_name>"

feed = [{
  name = "<feed>"
  parameters = [{
    "key" : "cron",
    "value" : "* * * * *"
  }]
}]

