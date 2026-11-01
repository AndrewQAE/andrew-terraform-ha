variable "ami" {
  type        = string
  description = "The AMI to use for the instance"
  default     = "ami-0e5df6fd7455a69b3"
}

variable "instance_type" {
  type        = string
  description = "The type of instance to use"
  default     = "t3.micro"
}

variable "key_name" {
  type        = string
  description = "The name of the key pair to use for the instance"
  default     = "thomas"
}

variable "environment" {
  type        = string
  description = "The environment to deploy to"
  default     = "dev"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the Auto Scaling Group"
  default     = ["subnet-05f806379727510a1", "subnet-006f580470672aa42", "subnet-0cad5914a26b35df6"]
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID for the load balancer"
  default     = "vpc-0021093bed929b9bd"
}
