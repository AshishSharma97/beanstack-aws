output "env_id" {
  value = aws_elastic_beanstalk_environment.app-prod.id
}

output "endpoint_url" {
  value = aws_elastic_beanstalk_environment.app-prod.endpoint_url
}

output "app_arn" {
  value = "${aws_elastic_beanstalk_application.app.arn}"
}
