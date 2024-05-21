module "private_instance" {
    source = "terraform-aws-modules/ec2-instance/aws"

    depends_on = [ module.private_sg ]
    name = "private-one"

    ami = data.aws_ami.amazonlin2.id

    instance_type = "t2.micro"
    key_name = "EC2 Tutorial"

    vpc_security_group_ids = [module.private_sg.security_group_id]
    subnet_id = module.vpc.private_subnets[0]

}