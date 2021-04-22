########################################################
# Package configuration
# Copyright 2020 IBM
########################################################

/****************************************************
Example Usage
//mandatory variables

resource_group_name = "default"

namespace_name = "function-namespace-name"
provision_namespace = true

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

resource_group_name = "<resource_group_name>"

namespace_name      = "<namespace_name>"
provision_namespace = "<true_or_false>"

package_name = "<package_name>"
