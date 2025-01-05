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
            commit_message = payload.get("commit_message", "No commit message found")
            print(f"Mensaje recibido: {commit_message} ")
            response = client.publish(TopicArn=SNS_TOPIC_ARN,Message="Mensaje procesado con éxito: " + commit_message)
            print(f"Mensaje enviado a SNS: {response}")
        except json.JSONDecodeError:
            print(f"El mensaje no es un JSON válido: {payload}")

        print(f"Payload procesado: {payload}")
