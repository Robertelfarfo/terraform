module "ec2_instance" {
    source = "terraform-aws-modules/ec2-instance/aws"
    depends_on = [ aws_iam_role.ec2_read_secrets ]
    name = "bastion-host-one"

    ami = data.aws_ami.amazonlin2.id

    iam_instance_profile = aws_iam_role.ec2_read_secrets.name
    user_data = "${file("init.sh")}"

    instance_type = "t2.micro"
    key_name = "EC2 Tutorial"

    vpc_security_group_ids = [module.bastion_sg.security_group_id]
    subnet_id = module.vpc.public_subnets[0]

}