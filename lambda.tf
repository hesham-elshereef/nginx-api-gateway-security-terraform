
# Backend Lambda
resource "aws_lambda_function" "users" {
  function_name = "get-users-lambda"

  role = "arn:aws:iam::232812966651:role/service-role/get-users-lambda-role-6qk8ocfp"

  runtime       = "nodejs26.x"
  handler       = "index.handler"
  memory_size   = 128
  timeout       = 3
  package_type  = "Zip"

  filename = "placeholder.zip"

  lifecycle {
    prevent_destroy = true

    ignore_changes = [
      filename,
      environment,
      source_code_hash
    ]
  }
}

# Lambda Authorizer
resource "aws_lambda_function" "authorizer" {
  function_name = "custom-header-authorizer"

  role = "arn:aws:iam::232812966651:role/service-role/custom-header-authorizer-role-jfuy8y00"

  runtime       = "nodejs26.x"
  handler       = "index.handler"
  memory_size   = 128
  timeout       = 3
  package_type  = "Zip"

  filename = "placeholder.zip"

  lifecycle {
    prevent_destroy = true

    ignore_changes = [
      filename,
      environment,
      source_code_hash
    ]
  }
}
