module "api" {
  for_each = toset(local.names)

  source = "../../../module/ecr"
  name   = each.value
}
