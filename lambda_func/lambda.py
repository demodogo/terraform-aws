import json
import boto3
import os

client = boto3.client('sns')

SNS_TOPIC_ARN = os.environ['SNS_TOPIC_ARN']

def lambda_handler(event, context):
    for record in event["Records"]:
        payload = record["body"]
        try:
            payload = json.loads(payload)
            print("Mensaje recibido: " + str(payload))
            response = client.publish(TopicArn=SNS_TOPIC_ARN,Message="Mensajes de SQS procesados con éxito: " + str(payload))
            print("Noticación enviada con éxito")
            return (response)
        except json.JSONDecodeError:
            print(f"El mensaje no es un JSON válido: {payload}")

        print(f"Payload procesado: {payload}")
