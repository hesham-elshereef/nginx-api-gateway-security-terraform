
resource "aws_security_group" "nginx_sg" {
  name        = "launch-wizard-1"
  description = "launch-wizard-1 created 2026-11-15T16:20:31.416Z"
  vpc_id      = "vpc-0a619531097127ed2"

  ingress {
    description = ""
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = ""
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
      "197.120.161.253/32",
      "0.0.0.0/0"
    ]
  }

  egress {
    description = ""
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    prevent_destroy = true
  }
}
