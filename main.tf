terraform {
  required_providers {
    checkpoint = {
      source  = "checkpointsw/checkpoint"
      version = "~> 1.6.0"
    }
  }
}

# Configure the Check Point Provider
provider "checkpoint" {
  server   = var.cp-mgmt-server
  username = var.cp-mgmt-username
  password = var.cp-mgmt-password
  context  = var.cp-mgmt-context
}



resource "checkpoint_management_service_tcp" "create-port" {
  name = var.cp-service-name
  port = var.cp-port
  keep_connections_open_after_policy_installation = false
  session_timeout = 0
  match_for_any = true
  sync_connections_on_cluster = true
  aggressive_aging = {
    enable = true
    timeout = 360
    use_default_timeout = fals
}

resource "checkpoint_management_publish" "example" { }
