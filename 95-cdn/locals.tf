locals {
    cachingDisabled = data.aws_cloudfront_cache_policy.cachingDisabled.id
    cachingOptimized = data.aws_cloudfront_cache_policy.cachingOptimized.id
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = true
    }
    cloudfront_final_tags = merge(
        local.common_tags,
        {
            Name = "${var.project}-${var.environment}-frontend"
        }
    )
    acm_certificate_arn = data.aws_ssm_parameter.acm_certificate_arn.value
}