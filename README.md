1. This will create a AWS EKS cluster.
2. Creates jenkins server after creating the cluster
3. Jenkins service will be available on a Nodeport. make sure to open the port from the local machine to the node on port 32000 to access the Jenkins URL.(Update nodegroups security group)

