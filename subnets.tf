resource "aws_subnet" "subnets" {
    count =3
    vpc_id = aws_vpc.ajay.id
    cidr_block = element(var.publiccidr_block,count.index)
    availability_zone = element(var.azs,count.index)
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.vpc_name}-publicsubnet${count.index+1}"
    }
  
}
resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.ajay.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "${var.vpc_name}-rt"
    }
  
}

resource "aws_route_table_association" "associate" {
    count=3
    route_table_id = aws_route_table.rt.id
    subnet_id = element(aws_subnet.subnets.*.id,count.index) 
}