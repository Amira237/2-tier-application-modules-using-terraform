# create 2 private subnets
resource "aws_subnet" "private-subnet" {
  for_each = var.private-subnets
 
  availability_zone_id = each.value["availability_zone"]
  cidr_block = each.value["cidr"]
  vpc_id = data.aws_vpc.myvpc.id

  tags = {
    Name = "${var.myname}-${each.key}"
  }
  }

# create public subnet  
resource "aws_subnet" "public-subnet" {
   for_each = var.public-subnets
 
  availability_zone_id = each.value["availability_zone"]
  cidr_block = each.value["cidr"]
  vpc_id = data.aws_vpc.myvpc.id

  tags = {
    Name = "${var.myname}-${each.key}"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = data.aws_vpc.myvpc.id

  tags = {
    Name = "${var.myname}-gw"
  }
}
#The Public Route Table
resource "aws_route_table" "public_subnet_route_table" {
  vpc_id = data.aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

}

# associate route table to the public subnet 
resource "aws_route_table_association" "public" {     
  subnet_id      = aws_subnet.public-subnet["public-sub"].id
  route_table_id = aws_route_table.public_subnet_route_table.id
}


#The Private Route Table
resource "aws_route_table" "private_subnet_route_table" {
  vpc_id = data.aws_vpc.myvpc.id
}

# associate route table to the private subnet 
resource "aws_route_table_association" "private" {     
for_each = aws_subnet.private-subnet 
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_subnet_route_table.id
}
