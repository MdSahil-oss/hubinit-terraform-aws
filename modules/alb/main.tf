terraform {
  required_version = "~> 1.9.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_lb" "this" {
  for_each                 = var.alb_parameters
  name                     = each.key
  internal                 = each.value.internal
  load_balancer_type       = "application"
  security_groups          = each.value.security_groups
  subnets                  = each.value.subnets
  enable_http2             = each.value.enable_http2
  customer_owned_ipv4_pool = each.value.customer_owned_ipv4_pool

  access_logs {
    bucket  = each.value.access_logs.bucket && each.value.access_logs.bucket
    enabled = each.value.access_logs.bucket && each.value.access_logs.enabled
    prefix  = each.value.access_logs.bucket && each.value.access_logs.prefix
  }

  connection_logs {
    bucket  = each.value.connection_logs.bucket && each.value.connection_logs.bucket
    enabled = each.value.connection_logs.bucket && each.value.connection_logs.enabled
    prefix  = each.value.connection_logs.bucket && each.value.connection_logs.prefix
  }

  tags = merge(each.value.tags, {
    Name : each.key
  })
}

resource "aws_lb_target_group" "this" {
  for_each                      = var.target_group_parameters
  name                          = each.key
  load_balancing_algorithm_type = each.value.load_balancing_algorithm_type
  port                          = each.value.port
  protocol                      = each.value.protocol
  vpc_id                        = each.value.vpc_id
  target_type                   = each.value.target_type
  tags = merge(each.value.tags, {
    Name : each.key
  })
}

resource "aws_lb_listener" "this" {
  for_each          = var.listener_parameters
  load_balancer_arn = aws_lb.this.arn
  port              = each.value.port
  protocol          = each.value.protocol
  certificate_arn   = each.value.certificate_arn
  ssl_policy        = each.value.ssl_policy

  # TODO: Enhance `default_action` block in future as per need so that it can be configured by variables.
  default_action {
    type = "forward"
  }

  tags = merge(each.value.tags, {
    Name : each.key
  })
}

resource "aws_lb_target_group_attachment" "this" {
  for_each          = var.target_group_attachment_parameters
  target_group_arn  = each.value.target_group_arn
  target_id         = each.value.target_id
  port              = each.value.port
  availability_zone = each.value.availability_zone
}
