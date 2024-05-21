data "aws_ami" "amazonlin2" {
    most_recent = true
    owners = ["amazon"]
    filter {
      name = "name"
      values = ["amzn2-ami-kernel-*-gp2"]
    }
}