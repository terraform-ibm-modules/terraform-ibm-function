#####################################################
# IBM Cloud Function - periodic reminder slack example
# Copyright 2020 IBM
#####################################################
variable "is_new_namespace" {
  description = "Provision Namespace"
  type        = bool
  default     = true
}

variable "namespace_name" {
  description = "Namespace Name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "slack_webhook_url" {
  description = "Slack Web hook URL"
  type        = string
}

variable "cron" {
  description = "Cron schedule in UNIX crontab format"
  type        = string
}

variable "is_new_package" {
  description = "Provision Package"
  type        = bool
  default     = true
}

variable "is_new_action" {
  description = "Provision Action"
  type        = bool
  default     = true
}

