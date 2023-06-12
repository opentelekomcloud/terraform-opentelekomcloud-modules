/*=================================
VARIABLES
==================================*/
variable "default_tags_set" {
  default     = {}
  description = "Set of default tags for most of all resources"
}

variable "network_settings" {
  default = {
    /*Example:
    router_name = { #You can use any string as key
      distributed      = "true"                     #Distributed or not
      external_gateway = "private|public"           #External gateway id
      admin_state_up   = "true"                     #Administrative up/down status
      enable_snat      = "true"                     #Enable Source NAT for the router
      network_name     = "my_network"               #Network
      subnets = [
      {
        name             = "subnet_name"
        no_gateway       = "false"
        nameservers      = []
        enable_dhcp      = "true"
        gateway_ip       = "192.168.199.1"
        cidr             = "192.168.199.0/24"
        ip_version       = 4
        allocation_pools = {}
      },
    ]
  }
    */
  }
  type = map(object({
    distributed      = optional(bool, "false")
    external_gateway = optional(string, "")
    admin_state_up   = optional(bool, "true")
    enable_snat      = optional(bool)
    network_name     = optional(string)
    subnets          = optional(list(object({
      name             = string
      no_gateway       = optional(bool)
      nameservers      = optional(list(string))
      enable_dhcp      = optional(bool)
      gateway_ip       = optional(string)
      cidr             = optional(string)
      ip_version       = number
      allocation_pools = optional(list(map(any)), [])
    })))
  }))
  description = "Map with necessary for Network settings (current values in top level vars file)"
}
