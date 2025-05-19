locals {
  env = "stg"
  app = "app_name"
  names = [
    "${local.env}-${local.app}-api",
  ]
}
