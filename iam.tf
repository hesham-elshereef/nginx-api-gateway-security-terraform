
# IAM Role for Backend Lambda

resource "aws_iam_role" "users_role" {
  name = "get-users-lambda-role-6qk8ocfp"
  path = "/service-role/"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "lambda.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  max_session_duration = 3600

  lifecycle {
    prevent_destroy = true
  }
}


# IAM Role for Lambda Authorizer

resource "aws_iam_role" "authorizer_role" {
  name = "custom-header-authorizer-role-jfuy8y00"
  path = "/service-role/"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "lambda.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  max_session_duration = 3600

  lifecycle {
    prevent_destroy = true
  }
}
