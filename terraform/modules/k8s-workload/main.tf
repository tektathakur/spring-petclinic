resource "kubernetes_deployment" "petclinic" {
  metadata {
    name = "spring-petclinic"
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        test = "spring-petclinic"
      }
    }

    template {
      metadata {
        labels = {
          test = "spring-petclinic"
        }
      }

      spec {
        container {
          image = "tektathakur/docker-images:latest"
          name  = "spring-petclinic"

          port{
            container_port = 80
          }

        }
      }
    }
  }
}
