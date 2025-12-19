resource "aws_instance" "instance" {
  ami           = "ami-087d1c9a513324697"
  instance_type = "t3.micro"
  tags = {
    Name = "Que-2-tf"
  }
  vpc_security_group_ids = [aws_security_group.nginx_secgrp.id]
  user_data              = file("${path.module}/nginx.sh")
  key_name               = "aws"

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }
}