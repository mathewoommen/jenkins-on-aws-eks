1. This will create a AWS EKS cluster with node groups in the public subnet.
2. Creates Jenkins server after creating the cluster.
3. Jenkins service will be available on Nodeport 32000. This can be changed to a Loadbalancer .Make sure to open the port from the local machine to the node on port 32000 to access the Jenkins URL.(Update nodegroups security group)

