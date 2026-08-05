job "hello" {
  datacenters = ["dc1"]
  type        = "service"

  group "hello-group" {
    count = 1

    network {
      mode = "bridge"
      port "http" {
        to = 5000
      }
    }

    service {
      name = "hello-devops"
      port = "http"
      check {
        name     = "alive"
        type     = "tcp"
        interval = "30s"
        timeout  = "2s"
      }
    }

    task "hello-task" {
      driver = "docker"

      config {
        image        = "devops-hello:latest"
        command      = "python"
        args         = ["hello.py"]
        port_map {
          http = 5000
        }
        # Force logs to stdout/stderr so they can be scraped by Loki/Promtail
        logging {
          type = "json-file"
        }
      }

      resources {
        cpu    = 100   # MHz
        memory = 128   # MB
      }

      env {
        PYTHONUNBUFFERED = "1"
        ENV              = "devops-intern"
      }
    }
  }
}
