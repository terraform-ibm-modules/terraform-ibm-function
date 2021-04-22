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

variable "create_namespace" {
  description = "Create new namespace or use existing namespace"
  type        = bool
  default     = true
}


