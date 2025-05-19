variable "name" {
  type        = string
  description = "The name of the repository"
}

variable "expire_count" {
  type        = number
  description = "The number of images to keep in the repository"
  default     = 30
}
