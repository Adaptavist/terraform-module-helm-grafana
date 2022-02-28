
module "acm_request_certificate" {
  source                            = "git::https://github.com/cloudposse/terraform-aws-acm-request-certificate.git?ref=tags/0.16.0"
  domain_name                       = local.grafana_domain
  zone_name                         = var.acm_r53_zone_name
  process_domain_validation_options = true
  wait_for_certificate_issued       = true
  ttl                               = 172800
  tags                              = var.tags
}
