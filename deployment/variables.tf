variable "aws_region" {
  description = "AWS region for deployment"
  default     = "ap-south-1"
}

variable "lambda_function_name" {
  description = "Lambda function name"
  default     = "ListDynamoDBTables"
}
