import boto3
import os

def lambda_handler(event, context):
    """
    Lists all DynamoDB tables in the local environment.
    """

    # DynamoDB local endpoint
    dynamodb_local_url = os.getenv("DYNAMODB_LOCAL_URL", "http://localhost:8000")

    # Connect to local DynamoDB
    dynamodb = boto3.client("dynamodb")

    try:
        response = dynamodb.list_tables()
        return {
            "statusCode": 200,
            "body": {"tables": response.get("TableNames", [])}
        }
    except Exception as e:
        return {
            "statusCode": 500,
            "body": {"error": str(e)}
        }


print(lambda_handler({},{}))