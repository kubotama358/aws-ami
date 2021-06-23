#####################################
# IAM Policy
#####################################
resource "aws_iam_policy" "server_execution_policy" {
    name   = "ServerExecutionPolicy"
    path   = "/"
    policy = "${data.aws_iam_policy_document.server_execution_policy_document.json}"
}

data "aws_iam_policy_document" "server_execution_policy_document" {
    statement {
        effect = "Allow"

        actions = [
            "ec2:*",
            "rds:*",
            "elasticloadbalancing:*",
            "cloudwatch:*",
            "logs:*",
            "s3:*",
            "sns:*",
            "codedeploy:*",
            "lambda:*",
            "route53:*",
            "route53domains:*",
            "states:*",
            "events:*",
            "es:*",
            "sqs:*",
            "dynamodb:*",
            "athena:*",
            "cloudfront:*",
            "waf:*",
            "waf-regional:*",
            "kinesis:*",
            "glue:*",
            "ecs:*",
            "ecr:*",
            "cognito-idp:*",
            "execute-api:*",
            "apigateway:*",
            "directconnect:*",
            "application-autoscaling:*",
            "batch:*",
            "firehose:*",
            "kms:*"
        ]

        resources = [
            "*",
        ]
    }
}