# Local Development Setup

This guide outlines the steps to set up and run the Game Sync application locally using LocalStack.

## 1. Start LocalStack

Ensure you have Docker installed and running. Then, start LocalStack with the necessary services:

```bash
docker run --rm -it -p 4566:4566 -p 4510-4559:4510-4559 localstack/localstack
```

This command will run in the foreground. You may need to open a new terminal for subsequent commands.

## 2. Configure Terraform for LocalStack

We need to modify the Terraform configuration to deploy resources to LocalStack instead of AWS. This involves updating the `provider "aws"` block in `infra/main.tf`.

## 3. Deploy Infrastructure with Terraform

Once LocalStack is running and Terraform is configured, deploy the infrastructure:

```bash
cd infra
terraform init
terraform apply --auto-approve
```

## 4. Configure Frontend for LocalStack

Update the `frontend/src/amplify_outputs.json` file to point to the LocalStack AppSync Events endpoint. The endpoint will typically be `http://localhost:4566/rest/appsync-events`.

## 5. Run the Frontend Application

```bash
cd frontend
npm start
```
