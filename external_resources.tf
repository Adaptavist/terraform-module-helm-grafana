data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

data "okta_group" "source_okta_admin_group" {
  for_each = toset(var.admin_okta_groups)
  name     = each.value
}

data "okta_group" "source_okta_viewers_group" {
  for_each = toset(var.viewers_okta_groups)
  name     = each.value
}