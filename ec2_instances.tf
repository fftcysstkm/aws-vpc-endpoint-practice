data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "test_ec2_1" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = "t2.micro"
  key_name                    = "test-keypair"
  vpc_security_group_ids      = [aws_security_group.test_sg_1.id]
  subnet_id                   = aws_subnet.test_subnet_0.id
  associate_public_ip_address = true
  tags = {
    Name = "test-ec2-1"
  }
}

resource "aws_instance" "test_ec2_2" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = "t2.micro"
  key_name               = "test-keypair"
  vpc_security_group_ids = [aws_security_group.test_sg_2.id]
  subnet_id              = aws_subnet.test_subnet_2.id
  tags = {
    Name = "test-ec2-2"
  }
}
