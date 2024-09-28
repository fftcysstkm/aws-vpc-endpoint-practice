// public subnetのルートテーブル
resource "aws_route_table" "test_route_table_0" {
  vpc_id = aws_vpc.test_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_igw.id
  }

  tags = {
    Name = "route-table-1"
  }

}
resource "aws_route_table_association" "test_route_table_association_1" {
  subnet_id      = aws_subnet.test_subnet_0.id
  route_table_id = aws_route_table.test_route_table_0.id
}


// private subnetのルートテーブル
resource "aws_route_table" "route_table_2" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "route-table-2"
  }
}

resource "aws_route_table_association" "route_table_association_2" {
  subnet_id      = aws_subnet.test_subnet_2.id
  route_table_id = aws_route_table.route_table_2.id
}

// VPCエンドポイントをルートに追加
resource "aws_vpc_endpoint_route_table_association" "endpoint_route_table_association_2" {
  route_table_id  = aws_route_table.route_table_2.id
  vpc_endpoint_id = aws_vpc_endpoint.endpoint_for_test_subnet_2.id
}
