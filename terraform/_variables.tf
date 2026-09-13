# General

variable "account_id" {
  type = string
}

variable "region" {
  type = string
}

variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

# VPC

variable "vpc_cidr" {
  type = string
}

variable "eks_cidr" {
  type    = string
  default = ""
}
