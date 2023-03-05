# Creating the DB Subnet Group
resource "aws_db_subnet_group" "amira_db_subnetgroup"{
    name         = "amira_db_subnetgroup"
    description  = "DB subnet group "
    subnet_ids   = [for subnet in aws_subnet.private-subnet:subnet.id]
}



# create RDS instance
resource "aws_db_instance" "RDS_instance" {
    allocated_storage = var.allocated_storage
    storage_type      = var.storage_type
    engine            = var.engine
    engine_version    = var.engine_version
    instance_class    = var.instance_class
    name              = "${var.myname}"
    username          = var.username
    password          = var.password
    publicly_accessible    = true
    skip_final_snapshot    = true
    db_subnet_group_name   = aws_db_subnet_group.amira_db_subnetgroup.id    
    vpc_security_group_ids=[aws_security_group.db-securitygroup.id]

    tags = {
        Name = "${var.myname}-MYSQL-db"
    }
}