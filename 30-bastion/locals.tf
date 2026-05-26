locals {
    ami_id = data.aws_ami.roboshop.id
    public_subnet_id = split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0]
    bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
    common_tags = {
        Project = var.project
        Environment = var.environment 
        Terraform = true
    }
    bastion_final_tags = merge(
        local.common_tags,
        {
            Name = "${var.project}-${var.environment}-bastion"
        }
    )
    iam_role_final_tags = merge(
        local.common_tags,
        {
            Name = "RoboShopDevBastion"
        }
    )
    root_final_tags = merge(
        {
            Name = "${var.project}-${var.environment}-bastion"
        },
        local.common_tags
    )
}