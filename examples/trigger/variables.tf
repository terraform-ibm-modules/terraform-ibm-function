#####################################################
# IBM Cloud Function Trigger - Example
# Copyright 2020 IBM
#####################################################

variable "is_new_namespace" {
  description = "Provision Namespace"
  type        = bool
  default     = true
}

variable "namespace_name" {
  description = "Name of namespace."
  type        = string
}

variable "namespace_description" {
  description = "Namespace Description."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "Resource Group Name."
  type        = string
}

variable "is_new_trigger" {
  description = "Provision Triger"
  type        = bool
  default     = true
}

variable "trigger_name" {
  description = "Name of Trigger."
  type        = string
}

variable "trigger_feed" {
  description = "Trigger feed"
  type        = list(any)
  default = [{
    "name" = "/whisk.system/alarms/alarm",
  "parameters" = "${"[{\"key\" : \"cron\",\"value\" : \"* * * * *\"}]"}" }]
}

variable "trigger_user_defined_annotations" {
  description = "Annotation values in KEY VALUE format."
  type        = string
  default     = null
}

variable "trigger_user_defined_parameters" {
  description = "Parameters values in KEY VALUE format. Parameter bindings included in the context passed to the trigger."
  type        = string
  default     = null
}