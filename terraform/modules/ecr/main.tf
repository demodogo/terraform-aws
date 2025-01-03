resource "aws_ecr_repository" "ecr_repository" {
  name                 = var.ecr_name
  image_tag_mutability = "MUTABLE"
  force_delete = true
}

resource "aws_ecr_repository_policy" "policy" {
  repository = aws_ecr_repository.ecr_repository.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowPushPull"
        Effect    = "Allow"
        Principal = {
          AWS = "*"
        }
        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:GetDownloadUrlForLayer",
          "ecr:PutImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload"
        ]
      }
    ]
  })
}
