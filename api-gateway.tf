resource "aws_apigatewayv2_api" "student_api" {
  name          = "student-secure-api"
  protocol_type = "HTTP"
}


# API Gateway Lambda Authorizer
resource "aws_apigatewayv2_authorizer" "header_authorizer" {
  api_id = aws_apigatewayv2_api.student_api.id

  name            = "custom-header-authorizer"
  authorizer_type = "REQUEST"
  authorizer_uri = aws_lambda_function.authorizer.invoke_arn
  authorizer_payload_format_version = "2.0"
  enable_simple_responses           = true
  authorizer_result_ttl_in_seconds  = 0
  identity_sources = ["$context.routeKey"]

  lifecycle {
    prevent_destroy = true
  }
}

# Backend Lambda Integration
resource "aws_apigatewayv2_integration" "users_integration" {
  api_id = aws_apigatewayv2_api.student_api.id
  integration_type       = "AWS_PROXY"
  integration_method     = "POST"
  integration_uri        = aws_lambda_function.users.arn
  payload_format_version = "2.0"
  timeout_milliseconds = 30000

  lifecycle {
    prevent_destroy = true
  }
}

# GET /users Route
resource "aws_apigatewayv2_route" "users_route" {
  api_id = aws_apigatewayv2_api.student_api.id
  route_key          = "GET /users"
  authorization_type = "CUSTOM"
  authorizer_id = aws_apigatewayv2_authorizer.header_authorizer.id
  target = "integrations/${aws_apigatewayv2_integration.users_integration.id}"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_apigatewayv2_stage" "default_stage" {
  api_id = aws_apigatewayv2_api.student_api.id
  name        = "$default"
  auto_deploy = true

  lifecycle {
    prevent_destroy = true
  }
}
