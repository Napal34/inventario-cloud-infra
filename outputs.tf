output "s3_bucket_name" {
  value       = aws_s3_bucket.product_assets.bucket
  description = "El nombre del bucket creado en tu infraestructura local"
}