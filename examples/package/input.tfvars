#####################################################
# IBM Cloud Function Package - Example
# Copyright 2020 IBM
#####################################################

/****************************************************
Example Usage
//mandatory variables

resource_group = "default"

namespace_name = "function-namespace-name"
is_new_namespace = true

package_name = "package-name"

// optional variables

bind_package_name = "package-name"

publish = true

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

resource_group      = "<resource_group>"
is_new_namespace    = "<namespace_name>"
provision_namespace = "<true_or_false>"
package_name        = "<package_name>"
