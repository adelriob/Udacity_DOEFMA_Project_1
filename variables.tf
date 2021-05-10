variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  default = "udacity-project-1"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "East US"
}

variable "username" {
  description = "Username Admin Linux"
  default = "adminudacity"
}

variable "password" {
  description = "Password Admin Linux"
  default = "PasswordAdmin7414.-"
}

variable "environment" {
  description = "Environment"
  default = "dev"
}

variable "project" {
  description = "Project name"
  default = "project_1"
}

variable "owner" {
  description = "owner name"
  default = "adelriob"
}

variable "image" {
  description = "image name"
  default = "project1_image"
}

variable "number_of_vms" {
  description = "Number of VM"
  type        = number
  default     = 3
}

