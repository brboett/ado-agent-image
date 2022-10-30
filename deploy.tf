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
  env = ["AZP_URL=https://dev.azure.com/MrBlnd", "AZP_TOKEN=7rzfei4li5xjzfn3er6ujocuxgrrogz2fte43tagtjpnw3523hua", "AZP_POOL=docker"]
}
