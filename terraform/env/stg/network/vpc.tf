data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = "${local.env}-${local.app}-vpc"
  cidr = "172.16.0.0/16"
  azs  = data.aws_availability_zones.available.names

  public_subnets       = ["172.16.1.0/24", "172.16.2.0/24"]
  public_subnet_suffix = "${local.env}.${local.app}-public.subnet"
  public_subnet_tags = {
    "environment" = local.env
    "Name"        = "${local.env}.${local.app}-public.subnet"
    "vpc:tier"    = "public"
    "type"        = "public"
  }

  enable_nat_gateway     = false
  single_nat_gateway     = false
  one_nat_gateway_per_az = false
  enable_dns_hostnames   = false

  tags = {
    "Name"        = "${local.env}.${local.app}.vpc"
    "Environment" = local.env
  }
}
