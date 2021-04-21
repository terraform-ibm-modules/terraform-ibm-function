

provider "ibm" {
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
