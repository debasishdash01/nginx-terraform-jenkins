resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "web_server" {
  image = docker_image.nginx.image_id
  name  = "local-web-server"
  ports {
    internal = 80
    external = 9090
  }
  volumes {
    host_path      = "${path.cwd}/index.html"
    container_path = "/usr/share/nginx/html/index.html"
  }
}
