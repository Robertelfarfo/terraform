module "bastion_sg" {
    source = "terraform-aws-modules/security-group/aws"
    name = "bastion-host-sg"
    description = "SG that allows SSH connection"

    vpc_id = module.vpc.vpc_id
    ingress_cidr_blocks = ["18.206.107.24/29"]
    ingress_rules = ["ssh-tcp" , "http-80-tcp"]

    # Egress Rule - all-all open
    egress_rules = ["all-all"]
 }


module "private_sg" {
    source = "terraform-aws-modules/security-group/aws"
    name = "private-sg"
    description =  "SG for instances in private subnets"
    depends_on = [ module.bastion_sg ]

    vpc_id = module.vpc.vpc_id

    
    computed_ingress_with_source_security_group_id = [
        {
            rule = "ssh-tcp"
            source_security_group_id = module.bastion_sg.security_group_id
        },
    ]

    number_of_computed_ingress_with_source_security_group_id = 1

    # Egress Rule - all-all open
    egress_rules = ["all-all"]

}