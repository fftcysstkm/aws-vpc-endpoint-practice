resource "aws_eip" "test_eip" {
  vpc = true
}

resource "aws_eip_association" "test_eip_association" {
  instance_id   = aws_instance.test_ec2_1.id
  allocation_id = aws_eip.test_eip.id
}
