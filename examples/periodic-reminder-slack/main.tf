#####################################################
# IBM Cloud Function - periodic reminder slack example
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

module "openwhisk-slack-package" {
  source = "../.."

  is_new_namespace    = true
  namespace_name      = var.namespace_name
  resource_group_name = var.resource_group_name

  is_new_package                  = true
  package_name                    = "openwhisk-slack"
  bind_package_name               = "/whisk.system/slack"
  package_user_defined_parameters = <<EOF
    [
        {
        "key" : "url",
        "value" : "${var.slack_webhook_url}"
        }
    ]
    EOF
}

module "send-message-action" {
  source = "../.."

  is_new_namespace    = false
  namespace_name      = var.namespace_name
  resource_group_name = var.resource_group_name

  is_new_package = true
  package_name   = "periodic-reminder-slack-package"


  is_new_action = true
  action_name   = "send-message"
  action_exec = [{
    kind = "nodejs:10"
    code = file("send-message.js")
  }]
  action_limits = [{
    timeout = 300000
  }]

  depends_on = [module.openwhisk-slack-package]
}

module "post-message-slack-sequence" {
  source = "../.."

  is_new_namespace    = false
  namespace_name      = var.namespace_name
  resource_group_name = var.resource_group_name

  package_name = module.send-message-action.package_name

  is_new_action = true
  action_name   = "post_message_slack_sequence"
  action_exec = [{
    kind = "sequence"
    components = [
      join("/", ["/", module.openwhisk-slack-package.namespace_id, module.send-message-action.package_name, "send-message"]),
      join("/", ["/", module.openwhisk-slack-package.namespace_id, module.openwhisk-slack-package.package_name, "post"])
    ]
  }]

  action_limits = [{
    timeout = 300000
  }]

  depends_on = [module.openwhisk-slack-package]
}


module "periodic-reminder-slack-trigger" {
  source = "../.."

  is_new_namespace    = false
  namespace_name      = var.namespace_name
  resource_group_name = var.resource_group_name
  package_name        = module.send-message-action.package_name


  is_new_trigger = true
  trigger_name   = "periodic-reminder-slack-trigger"
  trigger_feed = [{
    name       = "/whisk.system/alarms/alarm"
    parameters = <<EOF
    [
      {
        "key" : "cron",
        "value" : "${var.cron}"
      }
    ]
    EOF
  }]

  depends_on = [module.openwhisk-slack-package]
}



module "periodic-reminder-slack-rule" {
  source = "../.."

  is_new_namespace    = false
  namespace_name      = var.namespace_name
  resource_group_name = var.resource_group_name
  package_name        = module.send-message-action.package_name
  is_new_rule         = true
  rule_name           = "periodic-reminder-slack-rule"
  action_name         = "post_message_slack_sequence"
  trigger_name        = module.periodic-reminder-slack-trigger.trigger_name

  depends_on = [module.openwhisk-slack-package, module.post-message-slack-sequence]
}
