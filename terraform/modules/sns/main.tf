# Crear el topic SNS para enviar notificaciones
resource "aws_sns_topic" "alarm_notifications" {
  name = var.sns_topic_name
}

# Suscripción por correo electrónico
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.alarm_notifications.arn
  protocol  = "email"
  endpoint  = var.subscriber_email
}
