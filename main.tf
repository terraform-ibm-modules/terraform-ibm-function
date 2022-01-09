#####################################################
# IBM Cloud Function Module
# Copyright 2021 IBM
#####################################################

data "ibm_resource_group" "resource_group" {
  name = var.resource_group_name
}

###################################################################
# Create Namespace
###################################################################
data "ibm_function_namespace" "function_namespace" {
  count = var.is_new_namespace ? 0 : 1
  name  = var.namespace_name
}

resource "ibm_function_namespace" "function_namespace" {
  count             = var.is_new_namespace ? 1 : 0
  name              = var.namespace_name
  description       = (var.namespace_description != null ? var.namespace_description : null)
  resource_group_id = data.ibm_resource_group.resource_group.id
}

###################################################################
# Create Package
###################################################################
data "ibm_function_package" "function_package" {
  count     = var.is_package_enabled == true ? 1 : 0
  name      = var.package_name
  namespace = var.is_new_namespace ? ibm_function_namespace.function_namespace.0.name : data.ibm_function_namespace.function_namespace.0.name
}

resource "ibm_function_package" "function_package" {
  count                    = var.is_new_package ? 1 : 0
  name                     = var.package_name
  namespace                = var.is_new_namespace ? ibm_function_namespace.function_namespace.0.name : data.ibm_function_namespace.function_namespace.0.name
  publish                  = (var.package_publish != null ? var.package_publish : false)
  user_defined_annotations = (var.package_user_defined_annotations != null ? var.package_user_defined_annotations : "[]")
  user_defined_parameters  = (var.package_user_defined_parameters != null ? var.package_user_defined_parameters : "[]")
  bind_package_name        = (var.bind_package_name != null ? var.bind_package_name : null)
}

###################################################################
# Create Action
###################################################################
data "ibm_function_action" "function_action" {
  count     = var.is_action_enabled ? 1 : 0
  name      = (var.package_name != null ? join("/", [var.package_name, var.action_name]) : var.action_name)
  namespace = var.is_new_namespace ? ibm_function_namespace.function_namespace.0.name : data.ibm_function_namespace.function_namespace.0.name
}

resource "ibm_function_action" "function_action" {
  count     = var.is_new_action ? 1 : 0
  name      = (var.package_name != null ? join("/", [var.package_name, var.action_name]) : var.action_name)
  namespace = var.is_new_namespace ? ibm_function_namespace.function_namespace.0.name : data.ibm_function_namespace.function_namespace.0.name

  dynamic "limits" {
    for_each = (var.action_limits != null ? var.action_limits : [])
    content {
      timeout  = (lookup(limits.value, "timeout", null) != null ? limits.value.timeout : 60000)
      memory   = (lookup(limits.value, "memory", null) != null ? limits.value.memory : 256)
      log_size = (lookup(limits.value, "log_size", null) != null ? limits.value.log_size : 10)
    }
  }

  dynamic "exec" {
    for_each = (var.action_exec != null ? var.action_exec : [])
    content {
      image      = lookup(exec.value, "image", null)
      init       = lookup(exec.value, "init", null)
      code       = lookup(exec.value, "code", null)
      code_path  = lookup(exec.value, "code_path", null)
      kind       = exec.value.kind
      main       = lookup(exec.value, "main", null)
      components = lookup(exec.value, "components", null)
    }
  }

  publish                  = (var.action_publish != null ? var.action_publish : null)
  user_defined_annotations = (var.action_user_defined_annotations != null ? var.action_user_defined_annotations : "[]")
  user_defined_parameters  = (var.action_user_defined_parameters != null ? var.action_user_defined_parameters : "[]")

  depends_on = [ibm_function_package.function_package, ibm_function_namespace.function_namespace]
}

###################################################################
# Create Trigger
###################################################################
data "ibm_function_trigger" "function_trigger" {
  count     = var.is_trigger_enabled ? 1 : 0
  name      = var.trigger_name
  namespace = var.is_new_namespace ? ibm_function_namespace.function_namespace.0.name : data.ibm_function_namespace.function_namespace.0.name
}

resource "ibm_function_trigger" "function_trigger" {
  count     = var.is_new_trigger ? 1 : 0
  name      = var.trigger_name
  namespace = var.is_new_namespace ? ibm_function_namespace.function_namespace.0.name : data.ibm_function_namespace.function_namespace.0.name

  dynamic "feed" {
    for_each = (var.trigger_feed != null ? var.trigger_feed : [])
    content {
      name       = feed.value.name
      parameters = (lookup(feed.value, "parameters", null) != null ? feed.value.parameters : "[]")
    }
  }

  user_defined_annotations = (var.trigger_user_defined_annotations != null ? var.trigger_user_defined_annotations : "[]")
  user_defined_parameters  = (var.trigger_user_defined_parameters != null ? var.trigger_user_defined_parameters : "[]")

  depends_on = [ibm_function_namespace.function_namespace]
}

###################################################################
# Create Rule
###################################################################

resource "ibm_function_rule" "function_rule" {
  count        = var.is_new_rule ? 1 : 0
  name         = var.rule_name
  namespace    = var.is_new_namespace ? ibm_function_namespace.function_namespace.0.name : data.ibm_function_namespace.function_namespace.0.name
  trigger_name = var.trigger_name
  action_name  = (var.package_name != null ? join("/", [var.package_name, var.action_name]) : var.action_name)

  depends_on = [ibm_function_action.function_action, ibm_function_trigger.function_trigger, ibm_function_namespace.function_namespace]
}