Before running the terraform script, make sure you have the following environment variables set:

```
export AWS_ACCESS_KEY_ID=<your-access-key-id>
export AWS_SECRET_ACCESS_KEY=<your-secret-access-key>
export AWS_REGION=<your-aws-region>
```

To run the terraform script, run the following command:

```
terraform init
terraform apply
```

This will create a lambda function and a role with the necessary permissions to access DynamoDB.

The lambda function will be deployed to the local DynamoDB instance running on port 8000.

You can test the lambda function by running the following command:

```
aws lambda invoke --function-name list_dynamodb_tables --payload '{}' --region <your-aws-region> response.json
```

This will return a JSON response with the list of DynamoDB tables in the local environment. You can also check the AWS Lambda console to see the logs of the function.

# Packaging the Lambda function 

To package the lambda function, run the following command:

```
cd lambda
zip -r ../lambda_package.zip .
cd ..
```

# Creating the Lambda function
