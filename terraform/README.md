# terraform demo

Demonstrates using terraform to provision some IAM resources.

This module is expects that account credentials are available via environment variables or are set in `~/.aws`.

# plan

```
$ t plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_group.iam_group will be created
  + resource "aws_iam_group" "iam_group" {
      + arn       = (known after apply)
      + id        = (known after apply)
      + name      = "prod-ci-group"
      + path      = "/"
      + unique_id = (known after apply)
    }

  # aws_iam_group_policy_attachment.group_policy_attachment will be created
  + resource "aws_iam_group_policy_attachment" "group_policy_attachment" {
      + group      = "prod-ci-group"
      + id         = (known after apply)
      + policy_arn = (known after apply)
    }

  # aws_iam_policy.iam_policy will be created
  + resource "aws_iam_policy" "iam_policy" {
      + arn         = (known after apply)
      + description = "Allow users to assume a role"
      + id          = (known after apply)
      + name        = "prod-ci-policy"
      + path        = "/"
      + policy      = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "sts:AssumeRole",
                        ]
                      + Effect   = "Allow"
                      + Resource = "arn:aws:iam::REDACTED:role/prod-ci-role"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + policy_id   = (known after apply)
      + tags_all    = (known after apply)
    }

  # aws_iam_role.iam_role will be created
  + resource "aws_iam_role" "iam_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + AWS = "arn:aws:iam::REDACTED:root"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "prod-ci-role"
      + path                  = "/"
      + tags_all              = (known after apply)
      + unique_id             = (known after apply)

      + inline_policy {
          + name   = (known after apply)
          + policy = (known after apply)
        }
    }

  # aws_iam_user.iam_user will be created
  + resource "aws_iam_user" "iam_user" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "prod-ci-user"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

  # aws_iam_user_group_membership.user_group_membership will be created
  + resource "aws_iam_user_group_membership" "user_group_membership" {
      + groups = [
          + "prod-ci-group",
        ]
      + id     = (known after apply)
      + user   = "prod-ci-user"
    }

Plan: 6 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + iam_user_arn = (known after apply)

```

# demo

```
$ aws sts get-caller-identity
{
    "UserId": "xxx...",
    "Account": "REDACTED",
    "Arn": "arn:aws:iam::REDACTED:user/prod-ci-user"
}


$ aws sts assume-role --role-arn arn:aws:iam::REDACTED:role/prod-ci-role --role-session-name demo
{
    "Credentials": {
        "AccessKeyId": "xxx...",
        "SecretAccessKey": "xxx...",
        "SessionToken": "xxx...",
        "Expiration": "2021-07-21T01:49:14Z"
    },
    "AssumedRoleUser": {
        "AssumedRoleId": "xxx...:demo",
        "Arn": "arn:aws:sts::REDACTED:assumed-role/prod-ci-role/demo"
    }
}
```