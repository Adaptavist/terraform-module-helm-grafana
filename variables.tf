variable "acm_r53_zone_name" {
  type = string
  description = "The R53 zone name to use when creating the ACM cert"
}

variable "name" {
  default = "grafana"
  type    = string
  description = "The name of the grafana instance"
}

variable "namespace" {
  type = string
  description = "The k8 namespace to create the grafana stack within"
}

variable "create_namespace" {
  type    = bool
  default = false
  description = "Should the name space be created if ti does not exist"
}

variable "loki_chart_version" {
  default = "2.6.1"
  type    = string
  description = "Version of the loki helm chart to use, the chart come from the repo https://grafana.github.io/helm-charts"
}

variable "admin_okta_groups" {
  default = []
  type    = list(string)
  description = "Okta group which will get admin access to the grafana instance. Only groups that start 'AWS' can be used at this stage."
}

variable "viewers_okta_groups" {
  default = []
  type    = list(string)
  description = "Okta group which will get viewer access to the grafana instance. Only groups that start 'AWS' can be used at this stage."
}

variable "grafana_chart_version" {
  default = "32.2.1"
  type    = string
  description = "Version of the grafana helm chart to use, the chart come from the repo https://prometheus-community.github.io/helm-charts"
}

variable "alertmanager_storage" {
  default = 5
  type    = number
  description = "Storage in GB to allocate to the underlying alert manager service"
}

variable "prometheus_storage" {
  default = 15
  type    = number
  description = "Storage in GB to allocate to the underlying prometheus service"
}

variable "loki_storage" {
  default = 15
  type    = number
  description = "Storage in GB to allocate to the underlying loki service"
}

variable "tags" {
  type = map(any)
  description = "Tags that will be added to any AWS resources that are created"
}
