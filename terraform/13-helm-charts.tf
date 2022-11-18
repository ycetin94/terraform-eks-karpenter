
resource "helm_release" "argo_cd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = "5.13.2"
  namespace        = "argocd"
  create_namespace = true
 
  # values = [
  #   "${file("argocd-values.yaml")}"
  # ] 
   
  set {
    name  = "server.ingress.annotations.nginx\\.ingress\\.kubernetes\\.io/ssl-redirect"
    value = "false"
    type  = "string"
  }
  set {
    name  = "server.ingress.annotations.nginx\\.ingress\\.kubernetes\\.io/use-regex"
    value = "true"
    type  = "string"
  }
  set {
    name  = "server.ingress.annotations.nginx\\.ingress\\.kubernetes\\.io/rewrite-target"
    value = "/$1"
  }
  set {
    name  = "server.ingress.enabled"
    value = "true"
  }
  set {
    name  = "server.ingress.https"
    value = "true"
  }
  set {
    name  = "server.ingress.ingressClassName"
    value = "nginx"
  }
  set {
    name  = "server.ingress.pathType"
    value = "Prefix"
  }
 

  # set {
  #   name = "configs.secret.argocdServerAdminPassword"
  #   value = "yusuf.80"
  # }
}








# resource "helm_release" "jenkins" {
#   name       = "jenkins"
#   repository = "https://charts.jenkins.io"
#   chart      = "jenkins"

#   # values = [
#   #   "${file("jenkins-values.yaml")}"
#   # ]

#   set_sensitive {
#     name  = "controller.adminUser"
#     value = "admin"  #var.jenkins_admin_user
#   }

#   set_sensitive {
#     name  = "controller.adminPassword"
#     value = "admin" #var.jenkins_admin_password
#   }

#   set_sensitive {
#     name = "adminPassword"
#     value = "admin"
#   }  
# }

























# https://github.com/kubernetes/ingress-nginx/tree/main/charts/ingress-nginx
# resource "helm_release" "nginx_ingress_controller" {
#   name             = "nginx-ingress-controller"
#   repository       =  "https://helm.nginx.com/stable"   #"https://kubernetes.github.io/ingress-nginx"  
#   chart            = "ingress-nginx"   
#   version          = "4.4.0"
#   namespace        = "ingress"
#   create_namespace = "true"

#   set {
#     name  = "controller.service.type"
#     value ="LoadBalancer"
#   }
#   set {
#     name  = "controller.autoscaling.enabled"
#     value = "true"
#   }
#   set {
#     name  = "controller.autoscaling.minReplicas"
#     value = "2"
#   }
#   set {
#     name  = "controller.autoscaling.maxReplicas"
#     value = "10"
#   }
# }





# resource "helm_release" "argocd" {
#   name  = "argocd"

#   repository       = "https://argoproj.github.io/argo-helm"
#   chart            = "argo-cd"
#   namespace        = "argocd"
#   version          = "4.9.7"
#   create_namespace = true

#   values = [
#     file("argocd/application.yaml")
#   ]
# }




# resource "helm_release" "nginx_ingress" {
#   name       = "nginx-ingress-controller"

#   repository = "https://charts.bitnami.com/bitnami"
#   chart      = "nginx-ingress-controller"

#   set {
#     name  = "service.type"
#     value = "ClusterIP"
#   }
# }



# # https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack
# resource "helm_release" "prometheus_stack" {
#   name             = "prometheus-stack"
#   repository       = "https://prometheus-community.github.io/helm-charts"
#   chart            = "kube-prometheus-stack"
#   namespace        = "monitoring"
#   create_namespace = true

#   set {
#     name  = "grafana.ingress.enabled"
#     value = "true"
#   }
#   set {
#     name  = "grafana.ingress.ingressClassName"
#     value = "nginx"
#   }
#   set {
#     name  = "grafana.ingress.path"
#     value = "/(.*)" # "/grafana2/?(.*)"
#   }
#   # annotations:
#   #   nginx.ingress.kubernetes.io/ssl-redirect: "false"
#   #   nginx.ingress.kubernetes.io/use-regex: "true"
#   #   nginx.ingress.kubernetes.io/rewrite-target: /$1
#   set {
#     name  = "grafana.ingress.annotations.nginx\\.ingress\\.kubernetes\\.io/ssl-redirect"
#     value = "false"
#     type  = "string"
#   }
#   set {
#     name  = "grafana.ingress.annotations.nginx\\.ingress\\.kubernetes\\.io/use-regex"
#     value = "true"
#     type  = "string"
#   }
#   set {
#     name  = "grafana.ingress.annotations.nginx\\.ingress\\.kubernetes\\.io/rewrite-target"
#     value = "/$1"
#   }
#   set {
#     name  = "grafana.adminUser"
#     value =  "yusuf255363"
#   }
#   set {
#     name  = "grafana.adminPassword"
#     value = "yusuf255363"
#   }
# }





# # https://github.com/goharbor/harbor-helm
# resource "helm_release" "harbor" {
#   name       = "harbor"
#   repository = "https://helm.goharbor.io"
#   chart      = "harbor"
#   version          = "1.10.2"
#   namespace        = "harbor"
#   create_namespace = true

#   set {
#     name  = "expose.type"
#     value = "ingress"
#   }
#   set {
#     name = "harborAdminPassword"
#     value = "yusuf255363"
#   }
#   set {
#     name = "expose.ingress.className"
#     value ="nginx"
#   }
#   set {
#     name = "trace.enabled"
#     value = "true"
#   }
#   set {
#     name = "persistence.enabled"
#     value ="true"
#   }
#   set {
#     name = "clair.enabled"
#     value ="true"
#   }
#   set {
#     name = "notary.enabled"
#     value ="true"
#   }
#   set {
#     name = "trivy.enabled"
#     value ="true"
#   }
#   set {
#     name = "notary.enabled"
#     value ="true"
#   }
# }

# resource "helm_release" "redis" {
#   name             = "redis"
#   repository       = "https://charts.bitnami.com/bitnami"
#   chart            = "redis"
#   version          = "17.3.8"
#   namespace        = "redis-app"
#   create_namespace = true

#   # values = [
#   #   "${file("values.yaml")}"
#   # ]

#   set {
#     name  = "cluster.enabled"
#     value = "true"
#   }

#   set {
#     name  = "metrics.enabled"
#     value = "true"
#   }

#   set {
#     name  = "service.annotations.prometheus\\.io/port"
#     value = "9127"
#     type  = "string"
#   }
# }
