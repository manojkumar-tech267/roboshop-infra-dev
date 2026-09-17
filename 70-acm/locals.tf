locals {
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = true
    }
    acm_final_tags = merge(
        local.common_tags,
        {
            Name = "${var.project}-${var.environment}-${var.domain_name}"
        }
    )
}