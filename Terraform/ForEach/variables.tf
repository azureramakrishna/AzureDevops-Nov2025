variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "storageaccountname" {
  type = list(string)
}

variable "tags" {
  type = map(string)
  default = {
    environment = "Dev"
    project     = "Terraform"
  }
}