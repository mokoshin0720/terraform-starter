module "sg-ecs-api" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  vpc_id = module.vpc.vpc_id

  name          = "${local.env}.api.ecs.sg"
  ingress_rules = []
  egress_rules  = ["all-all"]

  tags = {
    Name        = "${local.env}.api.ecs.sg"
    Environment = local.env
  }
}
