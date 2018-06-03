resource "aws_instance" "demo_backend_terraform" {
    ami = "${var.backend_ami}"
    instance_type = "t2.micro"
    associate_public_ip_address = "false"
    subnet_id = "${aws_subnet.demo_private_subnet_aza.id}"
    vpc_security_group_ids = ["${aws_security_group.demo_backend_sg.id}"]
    key_name = "${var.key_name}"
    tags {
        Name = "demo_backend_terraform"
    }
}

resource "aws_instance" "demo_nat_terraform" {
    ami = "${var.nat_ami}"
    instance_type = "t2.micro"
    associate_public_ip_address = "true"
    subnet_id = "${aws_subnet.demo_public_subnet_aza.id}"
    vpc_security_group_ids = ["${aws_security_group.demo_nat_sg.id}"]
    key_name = "${var.key_name}"
    tags {
        Name = "demo_nat_terraform"
    }
}
