# Architecture

## Frontend

*   **Framework:** Angular
*   **Platform:** AWS Amplify
*   **Amplify Client:** The `aws-amplify` package will be used to connect to the AWS AppSync Event API.

## Backend

*   **API:** AWS AppSync (GraphQL) with AWS AppSync Events for real-time data.
*   **Real-time:** AWS AppSync Events will be used to broadcast real-time game data to clients.
    *   **Channels:** Channels will be used to scope data by sport and game (e.g., `nfl/2023-DAL-PHI`).
    *   **Handlers:** AWS Lambda functions will be used as `OnPublish` and `OnSubscribe` handlers to process and validate data.
*   **Data Storage:** Amazon DynamoDB will be used to store game data, schedules, and sync information.
*   **Business Logic:** AWS Lambda functions will be used for data processing, business logic, and as AppSync resolvers.

## Infrastructure

*   **Provisioning:** Terraform
*   **Deployment:** AWS CodePipeline (assumed)

## Diagram

(A diagram will be added here to visualize the architecture.)

