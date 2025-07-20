terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {}
}

provider "aws" {
  region = "us-east-1"
  endpoint = "http://localhost:4566"
  s3_use_path_style = true
  skip_credentials_validation = true
  skip_metadata_api_check = true
  skip_request_md5_check = true
  skip_region_validation = true
}

resource "aws_cloudformation_stack" "appsync_event_api" {
  name = "${var.app_name}-${var.app_environment}-events"

  template_body = file("${path.module}/appsync-event-api.yaml")

  parameters = {
    AppName        = var.app_name
    AppEnvironment = var.app_environment
    UserPoolId     = aws_cognito_user_pool.game_sync_user_pool.id
  }
}

output "cognito_user_pool_id" {
  description = "The ID of the Cognito User Pool"
  value       = aws_cognito_user_pool.game_sync_user_pool.id
}

output "cognito_user_pool_client_id" {
  description = "The ID of the Cognito User Pool Client"
  value       = aws_cognito_user_pool_client.game_sync_user_pool_client.id
}

output "appsync_api_id" {
  description = "The ID of the AppSync API"
  value       = aws_cloudformation_stack.appsync_event_api.outputs.AppSyncApiId
}

output "appsync_api_arn" {
  description = "The ARN of the AppSync API"
  value       = aws_cloudformation_stack.appsync_event_api.outputs.AppSyncApiArn
}
}
