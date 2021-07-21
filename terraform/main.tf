# mostly adapted from official docs at
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

data "aws_caller_identity" "current" {}

locals {
    account_id = data.aws_caller_identity.current.account_id
}

resource "aws_iam_group" "iam_group" {
  name = "${var.prefix}-group"
  path = "/"
}

# in this case we're using the entire account as a principal since we can't
# specify groups. The group/users will still additionally need to be allowed the
# AssumeRole permission.
resource "aws_iam_role" "iam_role" {
  name = "${var.prefix}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${local.account_id}:root"
        }
      },
    ]
  })
}

/* 
NOTE: in most cases tagging is a crucial part of running in production but for 
brevities sake I won't be tagging these resources.
*/

# see: 
# https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_permissions-to-switch.html
resource "aws_iam_policy" "iam_policy" {
  name        = "${var.prefix}-policy"
  path        = "/"
  description = "Allow users to assume a role"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:iam::${local.account_id}:role/${aws_iam_role.iam_role.name}"
      },
    ]
  })
}

resource "aws_iam_user" "iam_user" {
  name = "${var.prefix}-user"
  path = "/"
}

resource "aws_iam_user_group_membership" "user_group_membership" {
  user = aws_iam_user.iam_user.name

  groups = [
    aws_iam_group.iam_group.name
  ]
}

resource "aws_iam_group_policy_attachment" "group_policy_attachment" {
  group      = aws_iam_group.iam_group.name
  policy_arn = aws_iam_policy.iam_policy.arn
}