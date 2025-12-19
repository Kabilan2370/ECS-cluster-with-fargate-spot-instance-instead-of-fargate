# Alarm for High CPU 
resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          		= "docker-strapi-high-cpu"
  comparison_operator 	= "GreaterThanThreshold"
  evaluation_periods  	= 2
  metric_name         		= "CPUUtilization"
  namespace           		= "AWS/ECS"
  period              		= 60
  statistic           		= "Average"
  threshold           		= 80

  dimensions = {
    ClusterName = aws_ecs_cluster.cluster.name
    ServiceName = aws_ecs_service.strapi.name
  }
}

# Alarm for High memory
resource "aws_cloudwatch_metric_alarm" "high_memory" {
  alarm_name          		= "docker-strapi-high-memory"
  comparison_operator 	= "GreaterThanThreshold"
  evaluation_periods  	= 2
  metric_name         		= "MemoryUtilization"
  namespace           		= "AWS/ECS"
  period              		= 60
  statistic           		= "Average"
  threshold           		= 80

  dimensions = {
    ClusterName = aws_ecs_cluster.cluster.name
    ServiceName = aws_ecs_service.strapi.name
  }
}

resource "aws_cloudwatch_dashboard" "strapi" {
  dashboard_name = "docker-strapi-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric"
        properties = {
          region   = var.aws_region
          metrics = [
            ["AWS/ECS", "CPUUtilization", "ServiceName", aws_ecs_service.strapi.name, "ClusterName", aws_ecs_cluster.cluster.name],
            [".", "MemoryUtilization", ".", ".", ".", "."]
          ]
          period = 300
          stat   = "Average"
          title  = "Strapi CPU & Memory"
        }
      }
    ]
  })
}

