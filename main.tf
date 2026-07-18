# Configuración del Provider para hablar con tu LocalStack
provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true
  endpoints {
    s3 = "http://localhost:4566"
  }
}

# 1. Bucket principal de almacenamiento
resource "aws_s3_bucket" "product_assets" {
  bucket = "inventory-product-assets"
}

# 2. Bucket para almacenar los logs (necesario para medir latencia)
resource "aws_s3_bucket" "logs_bucket" {
  bucket = "inventory-logs-storage"
}

# 3. Configuración de Logging para el bucket principal
# Esto generará archivos con los tiempos de respuesta (latencia) de cada petición
resource "aws_s3_bucket_logging" "medicion_latencia" {
  bucket = aws_s3_bucket.product_assets.id

  target_bucket = aws_s3_bucket.logs_bucket.id
  target_prefix = "logs/"
}

# 4. Política de Acceso: Restringe el acceso a tu red local (localhost)
# Esto añade la capa de seguridad solicitada para tu entorno
resource "aws_s3_bucket_policy" "permitir_acceso_red_interna" {
  bucket = aws_s3_bucket.product_assets.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "RestringirAccesoRed"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:*"
        Resource  = [
          "${aws_s3_bucket.product_assets.arn}",
          "${aws_s3_bucket.product_assets.arn}/*"
        ]
        Condition = {
          IpAddress = { "aws:SourceIp" = "127.0.0.1/32" }
        }
      }
    ]
  })
}