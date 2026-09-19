data "aws_cloudfront_cache_policy" "cachingDisabled" {
  name = "Managed-CachingDisabled" # Provide the policy name
}


data "aws_cloudfront_cache_policy" "cachingOptimized" {
  name = "Managed-CachingOptimized" # Provide the policy name
}

data "aws_ssm_parameter" "acm_certificate_arn" {
  name = "/${var.project}/${var.environment}/frontend_alb_certificate_arn"
}