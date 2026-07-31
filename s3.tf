# module "logs_bucket" {
#   source      = "./modules/s3"
#   application = var.application
#   environment = var.environment
#   owner = var.owner
#   region = var.region 
#   cost_centre = var.cost_centre
#   deletion_window_in_days = var.deletion_window_in_days
#   rotation_period_in_days = var.rotation_period_in_days
# }