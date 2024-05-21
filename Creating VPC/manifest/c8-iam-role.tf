resource "aws_iam_role" "ec2_read_secrets" {
  name = "EC2_read_secrets"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
            "Service": "ec2.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
        }
    ]
  })



}

resource "aws_iam_policy" "read_secrets_policy" {
  name = "read_secrets_policy"
  description =  "Allow to read secrets"

  policy = jsonencode({
    Version: "2012-10-17",
    Statement: [
        {
            Effect: "Allow",
            Action: "secretsmanager:GetSecretValue",
            Resource: "*"
        },
    ]
  })

}

resource "aws_iam_instance_profile" "EC2_read_secrets" {
  name = "EC2_read_secrets"
  role = aws_iam_role.ec2_read_secrets.name
}

resource "aws_iam_role_policy_attachment" "ec2-read-attach" {
  role       = aws_iam_role.ec2_read_secrets.name
  policy_arn = aws_iam_policy.read_secrets_policy.arn
}