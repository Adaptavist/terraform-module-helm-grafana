resource "helm_release" "loki" {
  name             = "${local.grafana_label}-loki"
  repository       = "https://grafana.github.io/helm-charts"
  chart            = "loki-stack"
  version          = var.loki_chart_version
  namespace        = var.namespace
  create_namespace = var.create_namespace
  replace          = false
  recreate_pods    = true
  lint             = true
  wait_for_jobs    = true
  values           = [local.loki_helm_values]
}
