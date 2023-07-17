
resource "aws_iam_user" "s3_user" {
  name = var.user_name
  path = "/"
}

resource "aws_iam_access_key" "s3_user_key" {
  user = aws_iam_user.s3_user.name
}

resource "aws_iam_user_policy" "s3_user_policy" {
  name = var.policy_name
  user = aws_iam_user.s3_user.id

  policy = file("${path.module}/policy.json")

}
