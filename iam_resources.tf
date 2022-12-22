resource "aws_iam_role" "prod_ci_role" {
  name = "prod_ci_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "prod_ci"
  }
}
resource "aws_iam_policy" "prod_ci_policy" {
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "*",
    "Resource": "prod_ci_role"
  }
}
POLICY
}
resource "aws_iam_group" "group" {
  name = "prod_ci_group"
}
resource "aws_iam_group_policy_attachment" "prod_ci_attach" {
  group      = aws_iam_group.group.prod_ci_group
  policy_arn = aws_iam_policy.policy.arn
}
resource "aws_iam_user" "prod_ci_user" {
  name = "prod_ci_user"
}
resource "aws_iam_user_group_membership" "prod_ci_user_membership" {
  user = aws_iam_user.prod_ci_user

  groups = [
    aws_iam_group.prod_ci_group
  ]
}
