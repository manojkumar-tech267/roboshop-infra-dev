variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "sg_names" {
    type = list 
    default = ["mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "dispatch", "bastion", "frontend", "backend_alb", "frontend_alb"]
}