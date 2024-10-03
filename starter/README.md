# CD12352 - Infrastructure as Code Project Solution
# [ nasibah alharbi ]

## Spin up instructions
   Run the following command to create the CloudFormation stack [bash]:

1. **Create the Network Stack** 
     ./create.sh [stack name] network.yml network-parameters.json
**Parameters** 
    ProjectName: A project name that will be prefixed to resource names.
    VpcCIDR: The IP range (CIDR notation) for the VPC (default: 10.0.0.0/16).
    PublicSubnet1CIDR: Public subnet CIDR for AZ1 (default: 10.0.0.0/24).
    PublicSubnet2CIDR: Public subnet CIDR for AZ2 (default: 10.0.1.0/24).
    PrivateSubnet1CIDR: Private subnet CIDR for AZ1 (default: 10.0.2.0/24).
    PrivateSubnet2CIDR: Private subnet CIDR for AZ2 (default: 10.0.3.0/24).

2. **Create the server Stack** 
     ./create.sh [stack name] udagram.yml udagram-parameters.json
**Parameters** 
    ProjectName: A project name that will be prefixed to resource names.


## update stack/resources instructions
    Run the following command to update the deployed infrastructure [bash]:
1. **update the Network Stack** 
     ./update.sh [stack name] network.yml network-parameters.json
2. **Create the server Stack** 
     ./update.sh [stack name] udagram.yml udagram-parameters.json


## Tear down instructions
    Run the following command to tear down the deployed infrastructure [bash]:
    ./delete.sh [stack name]


## Output
1. **Network Stack Output** 
     VPC ID: A reference to the created VPC.
     Public Subnets: A list of the public subnets.
     Private Subnets: A list of the private subnets.
2. **Server Stack Output** 
     Load Balancer URL: The URL of the Load Balancer DNS Name.
     Bastion Host IPs: Public IPs for Bastion Hosts.
     Web Server Logs: Log group for Web Server logs.


## Other considerations
     Ensure that you have the necessary permissions to create the specified resources.
     Review security group rules before creating the application.
     Empty the S3 Buket before deleting the stack

