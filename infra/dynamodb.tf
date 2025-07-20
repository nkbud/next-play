resource "aws_dynamodb_table" "game_events" {
  name           = "${var.app_name}-${var.app_environment}-game-events"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "sport_id"
  range_key      = "game_id"

  attribute {
    name = "sport_id"
    type = "S"
  }

  attribute {
    name = "game_id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "game_schedule" {
  name           = "${var.app_name}-${var.app_environment}-game-schedule"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "sport_id"
  range_key      = "start_timestamp"

  attribute {
    name = "sport_id"
    type = "S"
  }

  attribute {
    name = "start_timestamp"
    type = "S"
  }
}