#!/bin/bash

set -e

echo "Deploying infrastructure to LocalStack..."
cd infra
terraform init
TF_OUTPUT=$(terraform apply --auto-approve -json)

USER_POOL_ID=$(echo $TF_OUTPUT | jq -r '.cognito_user_pool_id.value')
USER_POOL_CLIENT_ID=$(echo $TF_OUTPUT | jq -r '.cognito_user_pool_client_id.value')
APPSYNC_API_ID=$(echo $TF_OUTPUT | jq -r '.appsync_api_id.value')
APPSYNC_API_ARN=$(echo $TF_OUTPUT | jq -r '.appsync_api_arn.value')

cd ..

echo "Configuring frontend for LocalStack..."
# Update amplify_outputs.json with LocalStack endpoint and Cognito details
cat <<EOF > frontend/src/amplify_outputs.json
{
  "Auth": {
    "userPoolId": "$USER_POOL_ID",
    "userPoolWebClientId": "$USER_POOL_CLIENT_ID",
    "region": "us-east-1"
  },
  "API": {
    "Events": {
      "endpoint": "http://localhost:4566/rest/appsync-events",
      "region": "us-east-1",
      "defaultAuthMode": "AMAZON_COGNITO_USER_POOLS"
    }
  }
}
EOF

echo "Local setup complete. You can now run the frontend application: cd frontend && npm start"
