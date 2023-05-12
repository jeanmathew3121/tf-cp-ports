terraform {
  required_providers {
    checkpoint = {
      source  = "checkpointsw/checkpoint"
      //version = "~> 1.6.0"
    }
  }
}

# Configure the Check Point Provider
provider "checkpoint" {
  server   = var.cp-mgmt-server
  username = var.cp-mgmt-username
  password = var.cp-mgmt-password
  context  = var.cp-mgmt-context
  session_name = "terraform_session"
}



resource "checkpoint_management_service_tcp" "create-port" {
  name = var.port_name
  port = var.tcp_port

}

resource "checkpoint_management_publish" "publish" { }
resource "checkpoint_management_logout" "example" {
  depends_on = [
    checkpoint_management_publish.publish
 ]
}