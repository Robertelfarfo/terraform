#! /bin/bash
# aws --region us-east-1 secretsmanager get-secret-value --secret-id EC2Tutorial.pem --query SecretString --output text | tee ~/.ssh/EC2Tutorial.pem

echo "Hola" | sudo tee file.txt