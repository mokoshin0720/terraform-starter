output "values" {
  value = {
    vpc_id = module.vpc.vpc_id,
    subnets = {
      public  = module.vpc.public_subnets,
      private = module.vpc.private_subnets,
    }

    sg = {
      ecs = {
        api = module.sg-ecs-api.security_group_id
      }
    }
  }
}
