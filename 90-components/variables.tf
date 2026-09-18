variable "components" {
    default = {
        frontend = {
            rule_priority = 10
        }
        catalogue = {
            rule_priority = 10
        }
        user = {
            rule_priority = 20
        }
        cart = {
            rule_priority = 30
        }
        shipping = {
            rule_priority = 40
        }
        payment = {
            rule_priority = 50
        }
        mongodb = {
            rule_priority = 60
        }
        redis = {
            rule_priority = 70
        }
        mysql = {
            rule_priority = 80
        }
        rabbitmq = {
            rule_priority = 90
        }
    }
}