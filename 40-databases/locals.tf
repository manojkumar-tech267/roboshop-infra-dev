locals {
    ami_id = data.aws_ami.roboshop.id
    database_subnet_id = split(",", data.aws_ssm_parameter.database_subnet_ids.value)[0]
    mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
    redis_sg_id = data.aws_ssm_parameter.redis_sg_id.value
    mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value
    rabbitmq_sg_id = data.aws_ssm_parameter.rabbitmq_sg_id.value
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
    mysql_final_tags = merge(
        {
            Name = "${var.project}-${var.environment}-mysql"
        },
        local.common_tags
    )
    rabbitmq_final_tags = merge(
        {
            Name = "${var.project}-${var.environment}-rabbitmq"
        },
        local.common_tags
    )
    mysql_role_name = join("-",[ for name in ["${var.project}","${var.environment}","mysql"] : title(name) ])
    mysql_policy_name = join("",[ for name in ["${var.project}","${var.environment}","mysql"] : title(name) ])
}