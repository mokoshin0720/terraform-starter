module "api" {
  for_each = toset(local.names)

  source = "github.com/ispec-inc/aws-ecr-terraform?ref=v1.1.0"
  name   = each.value
}
