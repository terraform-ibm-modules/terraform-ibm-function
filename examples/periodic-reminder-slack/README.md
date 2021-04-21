# Function Module Example

This example illustrates how to use the terraform ibm cloud function modules by setting up the [Periodic Slack Reminder](https://cloud.ibm.com/docs/openwhisk?topic=openwhisk-templates#slack-reminder-template) quickstart template and covers all aspects of the function resources such as action, sequences, triggers, rules, package, binding, etc .

This module when deployed will post to slack on an interval provided by the user when setting up the periodic trigger. Before deploying this module, go to https://api.slack.com/incoming-webhooks to set up the incoming webhooks URL.


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