
resource "aws_instance" "nginx_server" {
  ami           = "ami-0aae07b42b5b77442"
  instance_type = "t3.micro"

  subnet_id = "subnet-0de2dd71a5cd89525"
  key_name  = "H_Elshereef_Frankfurt"

  vpc_security_group_ids = [
    aws_security_group.nginx_sg.id
  ]

  tags = {
    Name = "nginx-api-proxy"
  }

  lifecycle {
    prevent_destroy = true
  }
}
