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
  name = "brboettcher/adoagent:latest"
}

# Start a container
resource "docker_container" "dc_ado_agent" {
  name  = "ado_agent"
  image = docker_image.di_ado_agent.image_id
  env = ["AZP_URL=${AZP_URL}", "AZP_TOKEN=${AZP_TOKEN}", "AZP_POOL=${AZP_POOL}"]
}
