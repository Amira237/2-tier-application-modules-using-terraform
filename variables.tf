variable "vpc_id" {
   type=string
}
variable "myname" {
   type=string
}
data "aws_vpc" "myvpc" {
  id = var.vpc_id
 }

variable "private-subnets" {
    type = map
    default = {
      private-sub-1 = {
        availability_zone = "usw2-az1"
        cidr = "10.0.198.0/24"
      }
      private-sub-2 = {
         availability_zone= "usw2-az2"
         cidr = "10.0.199.0/24"
      }
   }
   
}
variable "public-subnets" {
    type = map
    default = {
  
      public-sub = {
         availability_zone= "usw2-az3"
         cidr = "10.0.200.0/24"
      }
    }
 }

 # database variables
 variable "allocated_storage"{
   description="data base storage size"
   default= 1
 }
variable "storage_type"{
   description="data storage type"
   default="gp2"
}
variable "username"{
   description="username of my SQL database"
}
variable "password"{
   description="password of my SQL database"
}
variable "instance_class"{
   description="instance_class of my SQL database"
   default="db.t2.micro"
}
variable "engine_version"{
   description="engine_version of my SQL database"
   default="8.0.27"
}
variable "engine"{
   description="engine of my SQL database"
   default="mysql"
}

variable "web_instance_ami"{
   description="web instance ami"
}
variable "instance_type"{
  description="web instance type"
}  

variable "key_pair"{
   description = " key pair of web instance"
}
 