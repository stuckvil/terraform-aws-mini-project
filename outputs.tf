output "public_ip" {
  value = aws_instance.web_server.public_ip
}

output "bucket_name" {
  value = aws_s3_bucket.project_bucket.bucket
}

output "iam_user" {
  value = aws_iam_user.devops_user.name
}
