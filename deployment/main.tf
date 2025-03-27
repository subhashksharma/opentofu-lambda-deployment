provider "aws" {
  region = var.aws_region
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"

assume_role_policy = file("resource/lambda-role-policy.json")
}

resource "aws_iam_policy" "lambda_dynamodb_policy" {
  name        = "LambdaDynamoDBPolicy"
  description = "Policy for Lambda to access DynamoDB"
  
  policy = file("resource/dynamo-db-policy.json")
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_dynamodb_policy.arn
}

resource "aws_lambda_function" "list_dynamodb_tables" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_role.arn
  runtime       = "python3.9"
  handler       = "lambda_function.lambda_handler"

  filename         = "lambda_package.zip"
  source_code_hash = filebase64sha256("lambda_package.zip")

}
