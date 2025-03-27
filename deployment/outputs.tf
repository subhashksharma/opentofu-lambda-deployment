output "lambda_function_name" {
  value = aws_lambda_function.list_dynamodb_tables.function_name
}

output "lambda_function_arn" {
  value = aws_lambda_function.list_dynamodb_tables.arn
}