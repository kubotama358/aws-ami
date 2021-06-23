#########################
## server_executionRole
#########################
resource "aws_iam_role" "server_execution_role" {
  name               = "ServerExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.ec2-role.json
}

resource "aws_iam_instance_profile" "server_execution_role_profile" {
  name = "ServerExecutionRole"
  role = aws_iam_role.server_execution_role.name
}

resource "aws_iam_role_policy_attachment" "server_execution_role-attach-iamfull" {
  role       = aws_iam_role.server_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

resource "aws_iam_role_policy_attachment" "server_execution_role-attach-server_execution_policy" {
  role       = aws_iam_role.server_execution_role.name
  policy_arn = "arn:aws:iam::${var.account_id}:policy/ServerExecutionPolicy"
}

resource "aws_iam_role_policy_attachment" "server_execution_role-attach-readonly" {
  role       = aws_iam_role.server_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

#####################################
# AssumeRole
#####################################

data "aws_iam_policy_document" "ec2-role" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}