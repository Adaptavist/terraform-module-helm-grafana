locals {
  grafana_domain = "${var.name}.${var.acm_r53_zone_name}"
  grafana_label  = "${var.name}-${data.aws_caller_identity.current.account_id}"
  grafana_helm_vars = {
    alertmanager_storage = var.alertmanager_storage
    prometheus_storage   = var.prometheus_storage
    admin_password       = uuid() // quite happy to have his rotated on every apply
    acm_cert_arn         = module.acm_request_certificate.arn
    grafana_host_name    = local.grafana_domain
    okta_client_id       = okta_app_oauth.app.client_id
    okta_client_secret   = okta_app_oauth.app.client_secret
    okta_admin_group     = okta_group.admins.name
    grafana_label     = local.grafana_label
  }
  loki_helm_vars = {
    loki_storage = var.loki_storage
  }
  grafana_helm_values = templatefile("${path.module}/grafana_helm_values.yml", local.grafana_helm_vars)
  loki_helm_values = templatefile("${path.module}/loki_helm_values.yml", local.loki_helm_vars)
}