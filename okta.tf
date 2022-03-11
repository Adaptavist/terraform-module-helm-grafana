resource "okta_app_oauth" "app" {
  label                     = local.grafana_label
  type                      = "web"
  grant_types               = ["authorization_code"]
  login_uri                 = "https://${local.grafana_domain}/okta"
  post_logout_redirect_uris = ["https://${local.grafana_domain}"]
  redirect_uris             = ["https://${local.grafana_domain}/login/okta"]

  groups_claim {
    type        = "FILTER"
    filter_type = "REGEX"
    name        = "groups"
    value       = "${local.grafana_label}.*"
  }
}

resource "okta_group" "admins" {
  name        = "${local.grafana_label}-admin"
  description = "Group of users with admin permissions to the grafana instance '${local.grafana_label}'"
}

resource "okta_group" "viewers" {
  name        = "${local.grafana_label}-viewers"
  description = "Group of users with read permissons to the grafana instance '${local.grafana_label}'"
}

resource "okta_app_group_assignments" "assignments" {
  app_id = okta_app_oauth.app.id
  group {
    id       = okta_group.admins.id
    priority = 1
  }
  group {
    id       = okta_group.viewers.id
    priority = 2
  }
}

resource "okta_group_rule" "admin_group_rule" {
  for_each          = toset(var.admin_okta_groups)
  name              = "admin_${local.grafana_label}_${index(var.admin_okta_groups, each.key)}"
  expression_value  = "isMemberOfGroup(\"${data.okta_group.source_okta_admin_group[each.key].id}\")"
  group_assignments = [okta_group.admins.id]
  status            = "ACTIVE"
}

resource "okta_group_rule" "viewer_admin_group_rule" {
  for_each          = toset(var.viewers_okta_groups)
  name              = "viewers_${local.grafana_label}_${index(var.viewers_okta_groups, each.key)}"
  expression_value  = "isMemberOfGroup(\"${data.okta_group.source_okta_viewers_group[each.key].id}\")"
  group_assignments = [okta_group.viewers.id]
  status            = "ACTIVE"
}


