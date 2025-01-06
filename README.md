
# Prueba Final Desafío LATAM


### Pasos para ejecutar el proyecto

1. ####   *Requisitos previos*
*  *Cuenta de AWS*: Asegúrate de tener acceso a una cuenta de AWS con los permisos necesarios (para propósitos del proyecto, el usuario utilizado cuenta con permisos de administrador, es decir, *full access*).


* *GitHub Repository*: Clona el repositorio del proyecto desde GitHub.
  ```bash
    git clone https://github.com/demodogo/terraform-aws
    cd terraform-aws
  ```
  
* *Terraform*: Instala Terraform en tu máquina local (versión mínima: 1.5.0).


* *AWS CLI*: Instala y configura AWS CLI en tu máquina local con credenciales válidas.


* *GitHub Actions*: Configura los secretos requeridos en el repositorio para GitHub Actions:

  | Nombre                  | Descripción                                                                        |
  |:------------------------|:-----------------------------------------------------------------------------------|
  | `AWS_ACCESS_KEY_ID`     | El key ID que obtienes de tu usuario *AWS*.                                        |
  | `AWS_SECRET_ACCESS_KEY` | Secret Access Key que obtienes de tu usuario *AWS*.                                |
  | `SNYK_TOKEN`            | Token de tu cuenta de *SNYK*, que puedes obtener desde tu perfil en su página web. |

  También debes configurar la siguiente variable:
  
  | Nombre       | Descripción                   |
    |:-------------|:------------------------------|
    | `AWS_REGION` | La región de tu cuenta *AWS*. |
* *Terraform State Bucket*: Accede a la consola de *AWS* (desde tu perfil) y crea un *bucket S3* para almacenar el backend de *Terraform*.
    

* *Terraform State Blocking*: Accede a la consola de *AWS* (desde tu perfil) y crea una tabla con *Dynamo DB* para manejar el bloqueo remoto y prevenir cambios simultaneos que generen errores.


  *Para ambos recursos, es suficiente la configuración básica*

2. #### *Pasos para la ejecución*
* *Configura el backend en Terraform*: Edita el archivo *terraform/main.tf* para que el backend apunte a los servicios que creaste previamente en *AWS*:

  ```terraform
  terraform {
  backend "s3" {
    bucket         = <NOMBRE-DE-TU-BUCKET>
    key            = "terraform/terraform.tfstate"
    region         = <TU-REGIÓN-DE-AWS>
    dynamodb_table = <NOMBRE-DE-TU-TABLA>
    encrypt        = true
  }

Configura el archivo *terraform/terraform.tfvars*.

 *a.* Cambia el valor de la variable "my_ip" por tu IP
````
  my_ip = <TU_IP>
```` 
 *b.* Cambia el valor de las variables "subscriber_email_lambda" y "subscriber_email" por tu dirección de correo electrónico
````
  subscriber_email = <TU CORREO ELECTRÓNICO>
  subscriber_email_lambda = <TU CORREO ELECTRÓNICO>
```` 

#### Correr el proyecto con las automatizaciones de *Github Actions*

* Luego de configurar el backend en *Terraform* (editar el archivo *terraform/main.tf* como se muestra en pasos anteriores), haz un push a la rama *main* de tu repositorio. Los *workflows* se ejecutarán automáticamente.

#### Confirmar la subscripción
* Accede al correo que definiste en las variables *subscriber_email* y
  *subscriber_email_lambda* y confirma tu subscripción a los topic creados.
### Testing

#### 2. EC2:
Puedes ir al paso ```Verificar que la API está activa``` en el workflow ```terraform_ec2.yml``` o ```Terraform EC2 Setup (with required resources) & Deployment```
y hacer click en el link luego de ```Run curl -I ...```

Ejemplo: ```Run curl -I http://<instance_public_ip>:3000/api```

#### 3. ECR Docker Image:
Ve a tu consola de *Amazon* y revisa tu *ECR*. Deberías ver tu imagen dentro del repositorio.

#### 3. Lambda:
Ve a tu consola de *Amazon* y accede al recurso *SQS* que se creó previamente.

Haz click en *"Enviar y recibir mensajes"*.

Escribe algo en el cuerpo del mensaje y haz click en *Enviar mensaje*.

Si redefiniste previamente las variables *subscriber_email* y
  *subscriber_email_lambda*, llegará un e-mail a tu correo con el contenido del mensaje que enviaste.