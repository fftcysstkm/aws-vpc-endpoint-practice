
// private subnetからS3へ通信できるよう、Gateway型のエンドポイントを設定
resource "aws_vpc_endpoint" "endpoint_for_test_subnet_2" {
  vpc_id       = aws_vpc.test_vpc.id
  service_name = "com.amazonaws.ap-northeast-1.s3"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "*"
        Effect    = "Allow"
        Principal = "*"
        Resource  = "*"
      }
    ]
  })

  route_table_ids = [aws_route_table.route_table_2.id]

  tags = {
    Name = "endpoint-for-test-subnet-2"
  }
}
