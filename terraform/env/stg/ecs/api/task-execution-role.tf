resource "aws_iam_role" "task_execution_role" {
  name = "${local.env}-ecs-api-task_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com",
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

data "aws_iam_policy" "ecs_task_execution_role_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

data "aws_iam_policy_document" "ecs_task_execution" {
  source_policy_documents = [data.aws_iam_policy.ecs_task_execution_role_policy.policy]

  statement {
    effect = "Allow"
    actions = [
      "ssm:GetParameters",
      "secretsmanager:GetSecretValue",
      "kms:Decrypt",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "execution_policy" {
  name        = "${local.env}-ecs-api-task-execution-policy"
  description = "ECS Task Execution Role"

  policy = data.aws_iam_policy_document.ecs_task_execution.json
}

resource "aws_iam_role_policy_attachment" "execution" {
  role       = aws_iam_role.task_execution_role.name
  policy_arn = aws_iam_policy.execution_policy.arn
}
