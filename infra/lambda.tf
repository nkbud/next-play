resource "aws_lambda_function" "game_schedule_update" {
  filename      = "lambda/game_schedule_update.py"
  function_name = "${var.app_name}-${var.app_environment}-game-schedule-update"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "game_schedule_update.handler"
  runtime       = "python3.9"

  source_code_hash = filebase64sha256("lambda/game_schedule_update.py")
}

resource "aws_lambda_function" "game_sync_resolver" {
  filename      = "lambda/game_sync_resolver.py"
  function_name = "${var.app_name}-${var.app_environment}-game-sync-resolver"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "game_sync_resolver.handler"
  runtime       = "python3.9"

  source_code_hash = filebase64sha256("lambda/game_sync_resolver.py")
}

resource "aws_iam_role" "lambda_exec" {
  name = "${var.app_name}-${var.app_environment}-lambda-exec"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}
