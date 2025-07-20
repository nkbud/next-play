resource "aws_cognito_user_pool" "game_sync_user_pool" {
  name = "${var.app_name}-${var.app_environment}-user-pool"

  auto_verified_attributes = ["email"]

  schema {
    name     = "email"
    required = true
    mutable  = true
    attribute_data_type = "String"
  }

  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
  }
}

resource "aws_cognito_user_pool_client" "game_sync_user_pool_client" {
  name                                 = "${var.app_name}-${var.app_environment}-user-pool-client"
  user_pool_id                         = aws_cognito_user_pool.game_sync_user_pool.id
  generate_secret                      = false
  explicit_auth_flows = [
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH"
  ]
  prevent_user_existence_errors = "ENABLED"
}
