variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "storageaccountname" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "count_value" {
  type = number
}