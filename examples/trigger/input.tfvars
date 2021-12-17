#####################################################
# IBM Cloud Function Trigger - Example
# Copyright 2020 IBM
#####################################################

/****************************************************
Example Usage

resource_group_name = "default"

namespace_name = "function-namespace-name"
is_new_namespace = true

trigger_name = "trigger-name"

trigger_feed = [{
  name = "/whisk.system/alarms/alarm"
  parameters = [
  {
    "key":"cron",
    "value":"* * * * *"
  }
  ]
}]

trigger_user_defined_parameters = <<EOF
  [
    {
      "key":"sample",
      "value":"sample"
    }
  ]
EOF

trigger_user_defined_annotations = <<EOF
  [
    {
      "key":"sample",
      "value":"sample"
    }
  ]
EOF

******************************************************/

resource_group_name = "default"
namespace_name      = "iam-namespace"
is_new_package      = true
package_name        = "iam-package"
is_new_trigger      = true
trigger_name        = "iam-trigger"

trigger_feed = [{ "name" = "/whisk.system/alarms/alarm", "parameters" = "${"[{\"key\" : \"cron\",\"value\" : \"* * * * *\"}]"}" }]

