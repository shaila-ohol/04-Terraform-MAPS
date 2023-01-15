//VARIABLES STORED AS MAPS
variable "users" {
  default = {
    ravs : { country : "NETHERLANDS", department : "TEST" }
    tom : { country : "US", department : "DEVELOPER" }
    jane : { country : "INDIA", department : "DEVOPS" }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_iam_user" "sushil_test_iam_users" {
  for_each = var.users
  name     = each.key
  tags = {
    #country: each.value
    country : each.value.country
    department : each.value.department
  }
}
/*
terraform console
lookup(var.names, "ravs")
"NETHERLANDS"
*/
