locals {
  env = "stg"
  app = "app_name"
  aws_account_id = "012345678901"
  names = [
    "${local.env}-${local.app}-api-gateway",
  ]
}
