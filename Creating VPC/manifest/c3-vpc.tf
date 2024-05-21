module "vpc" {
    source = "terraform-aws-modules/vpc/aws"

    # VPC Basic Details
    name = "vpc-dev"
    cidr = "30.0.0.0/16"   
    azs                 = ["us-east-1a", "us-east-1b"]
    private_subnets     = ["30.0.1.0/24", "30.0.2.0/24"]
    public_subnets      = ["30.0.101.0/24", "30.0.102.0/24"]

    

    private_subnet_names = ["private-one", "private-two"]
    public_subnet_names = ["bastiones-one","bastion-two"]
    
    manage_default_security_group = false
    create_database_subnet_group  = false
    manage_default_network_acl = false
    map_public_ip_on_launch = true
    vpc_tags = {
        Name = "vpc-dev"
    }

    igw_tags = {
        Name = "IGW-dev"
    }

    private_route_table_tags = {
        Name = "private-route-table"
    }

    public_route_table_tags = {
        Name = "public-route-table"
    }
}