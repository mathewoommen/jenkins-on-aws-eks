resource "kubernetes_manifest" "storage_class" {
  manifest = {
    "kind"       = "StorageClass",
    "apiVersion" = "storage.k8s.io/v1",
    "metadata" = {
      "name" = "local-storage"
    },
    "provisioner"       = "kubernetes.io/no-provisioner",
    "volumeBindingMode" = "WaitForFirstConsumer"
  }
}


resource "kubernetes_manifest" "persistent_volume" {
  manifest = {
    "apiVersion" = "v1",
    "kind"       = "PersistentVolume",
    "metadata" = {
      "name" = "jenkins-pv-volume",
      "labels" = {
        "type" = "local"
      }
    },
    "spec" = {
      "storageClassName" = "local-storage",
      "claimRef" = {
        "name"      = "jenkins-pv-claim",
        "namespace" = "devops-tools"
      },
      "capacity" = {
        "storage" = "10Gi"
      },
      "accessModes" = [
        "ReadWriteOnce"
      ],
      "local" = {
        "path" = "/mnt"
      },
      "nodeAffinity" = {
        "required" = {
          "nodeSelectorTerms" = [
            {
              "matchExpressions" = [
                {
                  "key"      = "eks.amazonaws.com/nodegroup",
                  "operator" = "In",
                  "values" = [
                    "test-inadev-ng-public"
                  ]
                }
              ]
            }
          ]
        }
      }
    }
  }
}


resource "kubernetes_manifest" "persistent_volume_claim" {
  manifest = {
    "apiVersion" = "v1",
    "kind"       = "PersistentVolumeClaim",
    "metadata" = {
      "name"      = "jenkins-pv-claim",
      "namespace" = "devops-tools"
    },
    "spec" = {
      "storageClassName" = "local-storage",
      "accessModes" = [
        "ReadWriteOnce"
      ],
      "resources" = {
        "requests" = {
          "storage" = "3Gi"
        }
      }
    }
  }
}
