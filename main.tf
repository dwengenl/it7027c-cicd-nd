terraform { 
  required_version = ">= 1.0.0" 
  
  required_providers { 
    docker = { 
      source = "kreuzwerker/docker" 
      version = "~> 3.0" 
    } 
  } 
}
  
provider "docker" { 
  host = "unix:///var/run/docker.sock" 
} 
  
#Provision a simple local Nginx container 
resource "docker_image" "nginx" { 
  name = "nginx:alpine" 
} 
  
resource "docker_container" "web" { 
  name = "cicd_demo_web" 
  image = docker_image.nginx.image_id 
  ports { 
    internal = 80 
    external = 8080 
  } 
}
