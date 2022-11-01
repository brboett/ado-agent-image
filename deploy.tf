terraform {
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
  name = "registry.hub.docker.com/brboettcher/adoagent:latest"
}

# Start a container
resource "docker_container" "dc_ado_agent" {
  name     = "ado_agent"
  image    = docker_image.di_ado_agent.image_id
  env      = ["AZP_URL=${var.AZP_URL}", "AZP_TOKEN=${var.AZP_TOKEN}", "AZP_POOL=${var.AZP_POOL}"]
  restart  = "no"
  must_run = "true"
}
