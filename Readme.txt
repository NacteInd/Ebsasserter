# The ebs_main.tf file Deploys EBS application on a Compute on OCI. Please make sure to update compartment ID, Subnet ID and ssh public key inside the tf file before deploying the stack

# The Weblogic.zip Deploys an OCI Instance with Weblogic installed and a sample app installed as well. There is a variable file which accepts VCN, Subnets, Secret (Weblogic password),WL Username SSH key etc at run time, please make sure these things are available before deploying the stack.

# The Domain.tf is used to create an Identity domain of type Oralce Apps Premium.
