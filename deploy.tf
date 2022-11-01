## Note: To run under Jenkins, add the variables into Jenkins as:
## TF_VAR_AZP_URL
## TF_VAR_AZP_TOKEN
## TF_VAR_AZP_POOL

terraform {
  
  backend "local" {
    path = "/home/bryan/State/ado_agent/terraform.tfstate"
  }
  
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.22.0"
    }
  }
}

variable "AZP_TOKEN" {  
  type        = string
  default     = ""
}

variable "AZP_URL" {  
  type        = string
  default     = ""
}

variable "AZP_POOL" {  
  type        = string
  default     = ""
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "di_ado_agent" {
  name = "brboettcher/adoagent:latest"
}

# Start a container
resource "docker_container" "dc_ado_agent" {
  name     = "ado_agent"
  image    = docker_image.di_ado_agent.image_id
  env      = ["AZP_URL=${var.AZP_URL}", "AZP_TOKEN=${var.AZP_TOKEN}", "AZP_POOL=${var.AZP_POOL}"]
  restart  = "no"
  must_run = "true"
}
