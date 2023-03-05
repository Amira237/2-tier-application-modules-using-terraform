#create ec2 instance for web application
resource "aws_instance" "web-ec2"{
    ami = var.web_instance_ami
    instance_type  = var.instance_type
    key_name = var.key_pair
    vpc_security_group_ids =[aws_security_group.web-securitygroup.id]
    subnet_id      = aws_subnet.public-subnet["public-sub"].id
    tags = {
       Name = "amira-web-instance"
    }
    
}