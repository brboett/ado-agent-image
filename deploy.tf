terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.22.0"
    }
  }
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
  env      = ["AZP_URL=${var.TF_VAR_AZP_URL}", "AZP_TOKEN=${var.TF_VAR_AZP_TOKEN}", "AZP_POOL=${var.TF_VAR_AZP_POOL}"]
  restart  = "no"
  must_run = "true"
}
