# Comprimir archivo .py que tiene la función
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/lambda_func" # Carpeta con tu código
  output_path = "${path.module}/terraform/modules/lambda/lambda.zip"
}

resource "aws_lambda_function" "lambda_function" {
  function_name    = "sqs-to-sns-processor"
  role             = var.lambda_exec_role_arn
  handler          = "lambda.lambda_handler"
  runtime          = "python3.9"
  filename         = "lambda_function.zip"
  source_code_hash = filebase64sha256("lambda_function.zip")
  timeout = 10
  environment {
    variables = {
      SNS_TOPIC_ARN = var.lambda_sns_topic_arn
    }
  }
}

resource "aws_lambda_event_source_mapping" "sqs_trigger" {
  event_source_arn = var.lambda_sns_topic_arn
  function_name    = aws_lambda_function.lambda_function.arn
  batch_size       = 5
}

