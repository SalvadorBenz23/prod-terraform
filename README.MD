1.	main.tf:
	-	This file will call the different modules and pass the necessary variables to them.
	
2.	variables.tf:
	-	This file defines all the variables used in the project, including region, VPC CIDR blocks, subnet CIDR blocks, etc.
	
3.	outputs.tf:
	-	This file defines the project outputs, such as subnet IDs and security group IDs.
	
4.	providers.tf:
	-	This file defines the providers and their configurations.

5.	modules/:
	-	This directory contains all the modules, each representing a logical infrastructure component.

6.	terraform.tfvars:
	-	This directory allows centralized control over values defined in the different modules.

