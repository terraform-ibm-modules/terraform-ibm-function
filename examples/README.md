# Function Module Example

This example illustrates how to use the terraform ibm cloud function modules by setting up the [Periodic Slack Reminder](https://cloud.ibm.com/docs/openwhisk?topic=openwhisk-templates#slack-reminder-template) quickstart template and illustrates all aspects of the modules such as action, sequences, triggers, rules, package, binding, etc . 

This module when deployed will post to slack on an interval provided by the user when setting up the periodic trigger. Before deploying this module, go to https://api.slack.com/incoming-webhooks to set up the incoming webhooks URL.


```hcl

provider "ibm" {
    ibmcloud_api_key=""
}

data "ibm_resource_group" "resource_group" {
  name = var.resource_group_name
}

module "periodic-reminder-slack-namespace" {
  source = "terraform-ibm-modules/function/ibm//modules/namespace"

  action = "create"
  name = var.namespace_name
  resource_group_id = data.ibm_resource_group.resource_group.id

}

module "openwhisk-slack-package" {
    source = "terraform-ibm-modules/function/ibm//modules/package"

    namespace_name = module.periodic-reminder-slack-namespace.name

    package_name = "openwhisk-slack"
    bind_package_name = "/whisk.system/slack"
    user_defined_parameters =  <<EOF
    [
        {
        "key" : "url",
        "value" : "${var.slack_webhook_url}"
        }
    ]
    EOF

}

module "send-message-action" {
  source = "terraform-ibm-modules/function/ibm//modules/action"

  namespace_name = module.periodic-reminder-slack-namespace.name

  package_name = "periodic-reminder-slack-package"
  create_package = true

  action_name = "send-message"
  exec = [{
    kind = "nodejs:10"
    code = file("send-message.js")
  }]
  limits = [{
    timeout = 300000
  }]

  depends_on = [module.openwhisk-slack-package]
}

module "post-message-slack-sequence" {
  source = "terraform-ibm-modules/function/ibm//modules/action"

  namespace_name = module.periodic-reminder-slack-namespace.name

  package_name = module.send-message-action.package_name

  action_name = "post_message_slack_sequence"
  exec = [{
    kind = "sequence"
    components = [
        join("/", ["/",module.periodic-reminder-slack-namespace.id, module.send-message-action.package_name, "send-message"]),
        join("/", ["/",module.periodic-reminder-slack-namespace.id, module.openwhisk-slack-package.name, "post"])
      ]
  }]
  limits = [{
    timeout = 300000
  }]

  depends_on = [module.openwhisk-slack-package]
}


module "periodic-reminder-slack-trigger" {
  source = "terraform-ibm-modules/function/ibm//modules/trigger"

  namespace_name = module.periodic-reminder-slack-namespace.name

  trigger_name = "periodic-reminder-slack-trigger"
  feed = [{
    name = "/whisk.system/alarms/alarm"
    parameters = <<EOF
    [
      {
        "key" : "cron",
        "value" : "${var.cron}"
      }
    ]
    EOF
  }]
}



module "periodic-reminder-slack-rule" {
  source = "terraform-ibm-modules/function/ibm//modules/rule"

  namespace_name = module.periodic-reminder-slack-namespace.name

  rule_name = "periodic-reminder-slack-rule"
  action_name = module.post-message-slack-sequence.name
  trigger_name = module.periodic-reminder-slack-trigger.name
  
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| resource\_group\_name | Name of the resource group | string | n/a | yes |
| namespace_name | The name of namespace | string | n/a | yes |
| slack_webhook_url | Slack webhook URL | string | n/a | yes |
| cron | Cron schedule in UNIX crontab format  | string | n/a | yes |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.