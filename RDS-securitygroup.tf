#create security group for database(RDS) 
resource "aws_security_group" "db-securitygroup" {
  name        = "${var.myname}_db_security_group"
  description = "security group for RDS"
  vpc_id      =  data.aws_vpc.myvpc.id
  ingress {
    description      = "allow only ec2 instances to communicate with RDS"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/16"]
        
  }
 
  tags = {
    Name = "${var.myname}_db_security_group"
  }
}