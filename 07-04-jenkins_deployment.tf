resource "kubernetes_manifest" "deployment" {

  manifest = {
    "apiVersion" = "apps/v1",
    "kind"       = "Deployment",
    "metadata" = {
      "name"      = "jenkins",
      "namespace" = "devops-tools"
    },
    "spec" = {
      "replicas" = 1,
      "selector" = {
        "matchLabels" = {
          "app" = "jenkins-server"
        }
      },
      "template" = {
        "metadata" = {
          "labels" = {
            "app" = "jenkins-server"
          }
        },
        "spec" = {
          "securityContext" = {
            "fsGroup"   = 1000,
            "runAsUser" = 1000
          },
          "serviceAccountName" = "jenkins-admin",
          "containers" = [
            {
              "name"  = "jenkins",
              "image" = "jenkins/jenkins:lts",
              "resources" = {
                "limits" = {
                  "memory" = "2Gi",
                },
                "requests" = {
                  "memory" = "500Mi",
                  "cpu"    = "500m"
                }
              },
              "ports" = [
                {
                  "name"          = "httpport",
                  "containerPort" = 8080
                },
                {
                  "name"          = "jnlpport",
                  "containerPort" = 50000
                }
              ],
              "livenessProbe" = {
                "httpGet" = {
                  "path" = "/login",
                  "port" = 8080
                },
                "initialDelaySeconds" = 90,
                "periodSeconds"       = 10,
                "timeoutSeconds"      = 5,
                "failureThreshold"    = 5
              },
              "readinessProbe" = {
                "httpGet" = {
                  "path" = "/login",
                  "port" = 8080
                },
                "initialDelaySeconds" = 60,
                "periodSeconds"       = 10,
                "timeoutSeconds"      = 5,
                "failureThreshold"    = 3
              },
              "volumeMounts" = [
                {
                  "name"      = "jenkins-data",
                  "mountPath" = "/var/jenkins_home"
                }
              ]
            }
          ],
          "volumes" = [
            {
              "name" = "jenkins-data",
              "persistentVolumeClaim" = {
                "claimName" = "jenkins-pv-claim"
              }
            }
          ]
        }
      }
    }
  }
}
