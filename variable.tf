 variable "name_resourcegroup" {
    type = string
    description = "Name of the Resource group"
    default = "rg-terraform-02"
}

variable "tags" {
    type = map

    default = {
        Environment = "Terraform demo"
        Dept = "Engineering"
        Project = "Project-01"
  }
}

variable "address" {
        default = ["10.0.0.0/16"]
}

variable "subnet01" {
        default = ["10.0.1.0/24"]
}

