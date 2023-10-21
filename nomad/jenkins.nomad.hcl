job "jenkins" {
  datacenters = ["dc1"]
  type = "service"

  group "jenkins" {
    count = 1

      
    task "jenkins" {
      driver = "docker"

      config {
        image = "jenkins/jenkins:lts"  # Use a imagem Docker do Jenkins que você deseja
      }

      resources {
        cpu    = 500  # Quantidade de CPU alocada
        memory = 512  # Quantidade de memória alocada (em MB)
        network {
          port "http" {
            {
            static = 8080
          }
          }
      }
      }

      service {
        name = "jenkins"
        port = "http"
        check {
          type     = "http"
          path     = "/login"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
    }
  }


