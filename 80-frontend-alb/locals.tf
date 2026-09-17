locals {
    frontend_alb_sg_id = data.aws_ssm_parameter.frontend_alb_sg_id.value
    public_subnet_ids = split(",",data.aws_ssm_parameter.public_subnet_ids.value)
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = true
    }
    alb_final_tags = merge(
        {
            Name = "${var.project}-${var.environment}-frontend"
        },
        local.common_tags
    )
    certificate_arn = data.aws_ssm_parameter.frontend_alb_certificate_arn.value
}