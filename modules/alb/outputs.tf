output "albs" {
  description = "Application load balancer Outputs"
  value       = { for alb in aws_lb.this : alb.name => { "id" : alb.id, "Internal" : alb.internal } }
}

output "target_groups" {
  description = "Target group Outputs"
  value       = { for tg in aws_lb_target_group.this : tg.name => { "id" : tg.id, "port" : tg.port, "protocol" : tg.protocol } }
}

output "alb_listeners" {
  description = "Application load balancer Outputs"
  value       = { for listener in aws_lb_listener.this : listener.tags.Name => { "id" : listener.id, "port" : listener.port, "protocol" : listener.protocol } }
}
