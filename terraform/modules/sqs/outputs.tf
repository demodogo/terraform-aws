output "sqs_arn" {
  value = aws_sqs_queue.lambda_queue.arn
}