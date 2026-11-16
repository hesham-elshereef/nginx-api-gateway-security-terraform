
# Allow API Gateway to invoke Backend Lambda
resource "aws_lambda_permission" "users_api_invoke" {
  statement_id = "30062871-729e-542a-b426-70ab708058d4"

  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.users.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "arn:aws:execute-api:eu-central-1:232812966651:bywr2o2c5a/*/*/users"

  lifecycle {
    prevent_destroy = true
  }
}

# Allow API Gateway to invoke Lambda Authorizer
resource "aws_lambda_permission" "authorizer_api_invoke" {
  statement_id = "d4663602-373d-5712-9bc0-2fc4acd38328"

  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.authorizer.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "arn:aws:execute-api:eu-central-1:232812966651:bywr2o2c5a/authorizers/sppyrk"

  lifecycle {
    prevent_destroy = true
  }
}

