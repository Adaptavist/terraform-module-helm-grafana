resource "helm_release" "grafana" {
  name             = "${local.grafana_label}-grafana"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  version          = var.grafana_chart_version
  namespace        = var.namespace
  create_namespace = var.create_namespace
  replace          = false
  recreate_pods    = true
  lint             = true
  wait_for_jobs    = true
  values           = [local.grafana_helm_values]
}