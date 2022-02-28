# modoule-helm-grafana

A module that deploys grafana within a kubernetes cluster using the helm provider offered by terraform. 
Alongside Grafana, Promtheus and loki are also installed. Persistent volumes are used to keep track of any state.
Grafana also uses Okta for its authorisation and authentication. 


## Requirements

| Name | Version |
|------|---------|
| okta | ~> 3.10 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| helm | n/a |
| okta | ~> 3.10 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| acm\_request\_certificate | git::https://github.com/cloudposse/terraform-aws-acm-request-certificate.git | tags/0.16.0 |

## Resources

| Name | Type |
|------|------|
| [helm_release.grafana](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.loki](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [okta_app_group_assignments.admins](https://registry.terraform.io/providers/okta/okta/latest/docs/resources/app_group_assignments) | resource |
| [okta_app_group_assignments.viewers](https://registry.terraform.io/providers/okta/okta/latest/docs/resources/app_group_assignments) | resource |
| [okta_app_oauth.app](https://registry.terraform.io/providers/okta/okta/latest/docs/resources/app_oauth) | resource |
| [okta_group.admins](https://registry.terraform.io/providers/okta/okta/latest/docs/resources/group) | resource |
| [okta_group.viewers](https://registry.terraform.io/providers/okta/okta/latest/docs/resources/group) | resource |
| [okta_group_rule.admin_group_rule](https://registry.terraform.io/providers/okta/okta/latest/docs/resources/group_rule) | resource |
| [okta_group_rule.viewer_admin_group_rule](https://registry.terraform.io/providers/okta/okta/latest/docs/resources/group_rule) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [okta_group.source_okta_admin_group](https://registry.terraform.io/providers/okta/okta/latest/docs/data-sources/group) | data source |
| [okta_group.source_okta_viewers_group](https://registry.terraform.io/providers/okta/okta/latest/docs/data-sources/group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| acm\_r53\_zone\_name | The R53 zone name to use when creating the ACM cert | `string` | n/a | yes |
| admin\_okta\_groups | Okta group which will get admin access to the grafana instance. Only groups that start 'AWS' can be used at this stage. | `list(string)` | <pre>[<br>  "AWSPlatformEksAdmin"<br>]</pre> | no |
| alertmanager\_storage | Storage in GB to allocate to the underlying alert manager service | `number` | `5` | no |
| create\_namespace | Should the name space be created if ti does not exist | `bool` | `false` | no |
| grafana\_chart\_version | Version of the grafana helm chart to use, the chart come from the repo https://prometheus-community.github.io/helm-charts | `string` | `"32.2.1"` | no |
| loki\_chart\_version | Version of the loki helm chart to use, the chart come from the repo https://grafana.github.io/helm-charts | `string` | `"2.6.1"` | no |
| loki\_storage | Storage in GB to allocate to the underlying loki service | `number` | `15` | no |
| name | The name of the grafana instance | `string` | `"grafana"` | no |
| namespace | The k8 namespace to create the grafana stack within | `string` | n/a | yes |
| prometheus\_storage | Storage in GB to allocate to the underlying prometheus service | `number` | `15` | no |
| tags | Tags that will be added to any AWS resources that are created | `map(any)` | n/a | yes |
| viewers\_okta\_groups | Okta group which will get viewer access to the grafana instance. Only groups that start 'AWS' can be used at this stage. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| grafana\_url | n/a |
