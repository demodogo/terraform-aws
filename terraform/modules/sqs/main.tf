resource "aws_sqs_queue" "lambda_queue" {
  name = "lambda-message-queue"
}

# Conectar SQS con Lambda
resource "aws_lambda_event_source_mapping" "sqs_trigger" {
  event_source_arn = aws_sqs_queue.lambda_queue.arn
  function_name    = var.lambda_function_name
  batch_size       = 10
  enabled          = true
}

resource "aws_sqs_queue_policy" "queue_policy" {
  queue_url = aws_sqs_queue.lambda_queue.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "SQS:SendMessage"
        Resource  = aws_sqs_queue.lambda_queue.arn
      }
    ]
  })
}