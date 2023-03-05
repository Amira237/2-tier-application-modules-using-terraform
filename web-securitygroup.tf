#security group for web app which allow http, https traffic
resource "aws_security_group" "web-securitygroup" {
  name        = "amira_web_security_group"
  description = "Allow http and https inbound traffic"
  vpc_id      =  data.aws_vpc.myvpc.id
  ingress {
    description      = "allow all traffic through HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]    
  }
  ingress {
    description      = "allow all traffic through HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "amira_web_security_group"
  }
}