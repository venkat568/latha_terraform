resource "aws_instance" "kishore" {
    count =1
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.sg.id]
    subnet_id =aws_subnet.subnets[0].id
    private_ip = var.private_ip
    tags = {
        Name = "${var.vpc_name}-server"
    }
}