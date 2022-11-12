# terraform-eks-karpenter

As a prerequisite, you must have helm, aws cli, kubectl and terraform installed on your system. Set aws configure ans enter your access key and secret key. 

1-Step ---***
firstly install karpenter hell chart on yout local system

helm repo add karpenter https://charts.karpenter.sh/
helm repo update

2.Step ---***

Go to the terraform folder in the repo and run the terraform init and apply commands  "cd terraform"   "terraform init"  "terraform apply"

3.step---***

If you get a karpenter helm chart error during terraform installation, run the "helm repo update" and continue with the "terraform apply" command again.



4.Step ---***


When the terraform eks installation is complete, check that the karpenter pod is working with the command "kubectl get po -A".
