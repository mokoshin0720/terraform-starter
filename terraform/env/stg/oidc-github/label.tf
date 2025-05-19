module "label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  namespace = "app_name"
  stage     = "stg"
  name      = "oidc-github"
  delimiter = "-"

  tags = {
    "Namespace" = "app_name",
    "Stage"     = "stg",
  }
}
