
# Backend Lambda IAM Policy
resource "aws_iam_policy" "users_policy" {
  name = "AWSLambdaBasicExecutionRole-e29ab897-e2cb-41d6-9709-c95b8f9601fe"
  path = "/service-role/"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect   = "Allow"
        Action   = "logs:CreateLogGroup"
        Resource = "arn:aws:logs:eu-central-1:232812966651:*"
      },
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = [
          "arn:aws:logs:eu-central-1:232812966651:log-group:/aws/lambda/get-users-lambda:*"
        ]
      }
    ]
  })

  lifecycle {
    prevent_destroy = true
  }
}

# Lambda Authorizer IAM Policy
resource "aws_iam_policy" "authorizer_policy" {
  name = "AWSLambdaBasicExecutionRole-d66bea47-d25b-4c0e-a805-5b9841e79e34"
  path = "/service-role/"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect   = "Allow"
        Action   = "logs:CreateLogGroup"
        Resource = "arn:aws:logs:eu-central-1:232812966651:*"
      },
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = [
          "arn:aws:logs:eu-central-1:232812966651:log-group:/aws/lambda/custom-header-authorizer:*"
        ]
      }
    ]
  })

  lifecycle {
    prevent_destroy = true
  }
}
