/*=================================
VARIABLES
==================================*/
variable "instance_type" {
  description = "ecs instance type"
  type        = string
  default     = "s2.large.4"
}

variable "instance_name" {
  type    = string
  default = "bastion-host"
  description = "Bastion instance name."
}

variable "bastion_image" {
  type    = string
  default = "Standard_Ubuntu_22.04_latest"
  description = "Bastion host image"
}

variable "sg_rules" {
  type = set(object({
    direction        = string
    ethertype        = string
    description      = optional(string)
    type             = optional(string)
    protocol         = optional(string)
    port_range_min   = optional(string)
    port_range_max   = optional(string)
    remote_ip_prefix = optional(string)
  }))

  default = [
    {
      direction   = "egress"
      protocol    = ""
      ethertype   = "IPv4"
      description = "Allow all outgoing connection within bastion security group."
      type        = "sg"
    },
    {
      direction   = "egress"
      protocol    = ""
      ethertype   = "IPv4"
      description = "Allow all outgoing connection from bastion."
      type        = "ip"
    },
    {
      direction   = "ingress"
      ethertype   = "IPv4"
      description = "Allow inbound connection within security group on any port."
      type        = "sg"
    },
    {
      direction      = "ingress"
      ethertype      = "IPv4"
      protocol       = "tcp"
      port_range_min = 80
      port_range_max = 80
      description    = "Allow connection to 80 port from internet"
      type           = "ip"
    },
    {
      direction      = "ingress"
      ethertype      = "IPv4"
      protocol       = "tcp"
      port_range_min = 443
      port_range_max = 443
      description    = "Allow connection to 443 port from internet"
    },
    {
      direction      = "ingress"
      ethertype      = "IPv4"
      protocol       = "tcp"
      port_range_min = 22
      port_range_max = 22
      description    = "Allow SSH connection from internet"
    },
  ]
}

variable "availability_zone" {
  type        = string
  description = "Bastion host availability zone."
  default = ""
}

variable "key_pair" {
  type = object({
    key_name = string
    public_key = string
  })

  default = {
    key_name = "bastion-host"
    public_key = ""
  }
}

variable "bastion_volume" {
  type    = number
  default = 20
}

variable "default_tags_set" {
  type        = map(string)
  description = "Set of default tags for most of all resources."
  default     = {}
}

variable "user_data" {
  description = "Custom ECS user data configuration."
  default     = ""
}

variable "subnet" {
  type = object({
  cidr = string
  id = string})
}
