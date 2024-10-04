resource "aws_security_group" "sg" {
    vpc_id = aws_vpc.ajay.id
    name = "kishore-sg"
    description = "allow inbound and outbound rules"

    ingress  {
        to_port = 0
        from_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
   egress {
    to_port = 0
    from_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
   }

   tags = {
    Name = "${var.vpc_name}-sg"
   }
}