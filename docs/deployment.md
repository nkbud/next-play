# Deployment

## Infrastructure

*   **Tool:** Terraform
*   **Provider:** AWS
*   **Backend:** S3

## Application

*   **Framework:** Angular
*   **Platform:** AWS Amplify

## Process

1.  **Infrastructure:**
    *   **AppSync Event API:** Since there is no dedicated Terraform resource for AppSync Event APIs, we will use CloudFormation to create the Event API resources and then import and manage them with Terraform.
    *   **Terraform:**
        *   Initialize Terraform: `terraform init`
        *   Plan changes: `terraform plan`
        *   Apply changes: `terraform apply`

2.  **Application:**
    *   Initialize Amplify: `amplify init`
    *   Configure Amplify client with `amplify_outputs.json`.
    *   Publish changes: `amplify publish`

## Terraform Resources

*   `aws_appsync_graphql_api`
*   `aws_appsync_datasource`
*   `aws_appsync_resolver`
*   `aws_cloudwatch_event_target`
*   `aws_cloudwatch_event_rule`

