variable "alb_parameters" {
  description = "A list of AWS application load balancer configurations"
  type = map(object({
    access_logs = optional(object({
      bucket  = string
      enabled = optional(bool, false)
      prefix  = optional(string, null)
      }), {}
    )
    connection_logs = optional(object({
      bucket  = string
      enabled = optional(bool, false)
      prefix  = optional(string, null)
      }), {}
    )
    customer_owned_ipv4_pool = optional(string, null)
    enable_http2             = optional(bool, true)
    internal                 = optional(bool, false)
    security_groups          = list(string)
    subnets                  = list(string)
    tags                     = optional(map(string), {})
  }))
  default = {}
}

variable "target_group_parameters" {
  description = "A list of load balancer target group configurations"
  type = map(object({
    load_balancing_algorithm_type = optional(string, "round_robin")
    port                          = number
    protocol                      = string
    vpc_id                        = string
    target_type                   = optional(string, "instance")
    tags                          = optional(map(string), {})
  }))
  default = {}
}

variable "listener_parameters" {
  description = "A list of load balancer listerner configurations"
  type = map(object({
    port            = optional(string, null)
    protocol        = optional(string, null)
    certificate_arn = optional(string, null)
    ssl_policy      = optional(string, "ELBSecurityPolicy-2016-08")
    tags            = optional(map(string), {})
  }))
  default = {}
}

variable "target_group_attachment_parameters" {
  description = "A list of load balancer target group attachments"
  type = map(object({
    target_group_arn  = string
    target_id         = string
    port              = optional(number, null)
    availability_zone = optional(string, null)
  }))
  default = {}
}
