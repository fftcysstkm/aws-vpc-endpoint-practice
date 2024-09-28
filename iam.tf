//参考：https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
//参考：https://spacelift.io/blog/terraform-iam-role

// IAMロール作成
resource "aws_iam_role" "test_ec2_role" {
  name = "test-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

// S3読み取り専用ポリシーを、IAMロールにアタッチ
resource "aws_iam_role_policy_attachment" "test_ec2_role_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  role       = aws_iam_role.test_ec2_role.name
}

// EC2のためのインスタンスプロファイルを作成し、IAMロールを関連付け
resource "aws_iam_instance_profile" "test_ec2_instance_profile" {
  name = "test-ec2-instance-profile"
  role = aws_iam_role.test_ec2_role.name
}
