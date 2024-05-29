#!/bin/bash
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html


aws --region us-east-1 secretsmanager get-secret-value --secret-id EC2Tutorial.pem --query SecretString --output text > home/ec2-user/.ssh/EC2Tutorial.pem
chown ec2-user:ec2-user /home/ec2-user/.ssh/EC2Tutorial.pem
chmod 600 /home/ec2-user/.ssh/EC2Tutorial.pem