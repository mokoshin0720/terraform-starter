resource "aws_ecs_cluster" "this" {
  name = "${local.env}-api"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_cloudwatch_log_group" "this" {
  name              = "/ecs/cluster/${local.env}-api"
  retention_in_days = 3
}
