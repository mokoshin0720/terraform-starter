module "oidc" {
  source = "../../../module/oidc-github"

  name = module.label.id

  org  = "mokoshin0720"
  repo = "terraform-starter"

  policy_json = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          # TODO: 必要なアクションを追加
        ]
        Resource = "*"
      },
    ]
  })
}
