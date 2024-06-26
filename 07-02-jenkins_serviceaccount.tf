resource "kubernetes_manifest" "cluster_role" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1",
    "kind"       = "ClusterRole",
    "metadata" = {
      "name" = "jenkins-admin"
    },
    "rules" = [
      {
        "apiGroups" = [
          ""
        ],
        "resources" = [
          "*"
        ],
        "verbs" = [
          "*"
        ]
      }
    ]
  }
}


resource "kubernetes_manifest" "service_account" {
  manifest = {
    "apiVersion" = "v1",
    "kind"       = "ServiceAccount",
    "metadata" = {
      "name"      = "jenkins-admin",
      "namespace" = "devops-tools"
    }
  }
}


resource "kubernetes_manifest" "cluster_role_binding" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1",
    "kind"       = "ClusterRoleBinding",
    "metadata" = {
      "name" = "jenkins-admin"
    },
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io",
      "kind"     = "ClusterRole",
      "name"     = "jenkins-admin"
    },
    "subjects" = [
      {
        "kind"      = "ServiceAccount",
        "name"      = "jenkins-admin",
        "namespace" = "devops-tools"
      }
    ]
  }
}
