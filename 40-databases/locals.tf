locals {
    ami_id = data.aws_ami.roboshop.id
    database_subnet_id = split(",", data.aws_ssm_parameter.database_subnet_ids.value)[0]
    mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
    redis_sg_id = data.aws_ssm_parameter.redis_sg_id.value
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = true
    }
    mongodb_final_tags = merge(
        {
            Name = "${var.project}-${var.environment}-mongodb"
        },
        local.common_tags
    )
    redis_final_tags = merge(
        {
            Name = "${var.project}-${var.environment}-redis"
        },
        local.common_tags
    )
}