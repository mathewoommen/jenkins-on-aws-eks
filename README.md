1. This will create a AWS EKS cluster with node groups in the public subnet.
2. Creates Jenkins server after creating the cluster.
3. A network load balancer will be created for the Jenkins service. Terraform will output the FQDN for the network load balancer.

