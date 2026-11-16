
# Authorizer Lambda Policy Attachment
resource "aws_iam_role_policy_attachment" "authorizer_basic_execution" {
  role = aws_iam_role.authorizer_role.name

  policy_arn = "arn:aws:iam::232812966651:policy/service-role/AWSLambdaBasicExecutionRole-d66bea47-d25b-4c0e-a805-5b9841e79e34"
}

# Backend Lambda Policy Attachment
resource "aws_iam_role_policy_attachment" "users_basic_execution" {
  role = aws_iam_role.users_role.name

  policy_arn = "arn:aws:iam::232812966651:policy/service-role/AWSLambdaBasicExecutionRole-e29ab897-e2cb-41d6-9709-c95b8f9601fe"
}
