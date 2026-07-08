locals {
    ami_id = data.aws_ami.roboshop.id
    catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.value
    private_subnet_id = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = true
    }
    catalogue_final_tags = merge(
        {
            Name = "${var.project}-${var.environment}-catalogue"
        },
        local.common_tags
    )
    aws_ami_final_tags = merge(
    {
      Name = "${var.project}-${var.environment}-catalogue-ami"
    },
    local.common_tags
  )
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  launch_template_final_tags = merge(
    {
      Name = "${var.project}-${var.environment}-catalogue"
    },
    local.common_tags
  )
  autoscaling_tags = merge(
    {
      Name = "${var.project}-${var.environment}-catalogue"
    },
    local.common_tags
  )
  backend_alb_listener_arn = data.aws_ssm_parameter.backend_alb_listener_arn.value
}