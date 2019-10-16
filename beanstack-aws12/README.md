<h1>terraform-aws-elastic-beanstalk-environment</h1>

<h2>Terraform module to provision AWS Elastic Beanstalk environment</h2>

This module will create a elastic beanstack environment having zip code present in s3 bucket.

Inputs:

| Name | Description | Type |
| :---         |     :---:      |          ---: |
| vpc_id | VPC CIDR | list(string) |
| subnet_id | Subnet CIDR  | list(string) |
| destination_cidr | destination CIDR for IG | list(string) |
| bucket_name | Bucket name in which code is present | string |
| key | source of zip code file | |
| app_name | application name of EB | String |
| app_description | application description of eb | String |
| env_name | env name of EB | String |
| solution_stack_name | A solution stack to base your environment off | String |
| EnvironmentType | Environment type, e.g. 'LoadBalanced' or 'SingleInstance'.  If setting to 'SingleInstance', `rolling_update_type` must be set to 'Time" | String |
| InstanceType | Instance Types | String | 
| BASE_HOST | environment properties | string |
| SystemType | Whether to enable \"enhanced\" health reporting for this environment.  If false, \"basic\" reporting is used.  When you set this to false, you must also set `enable_managed_actions` to false"  | String |
| MinSize | Minimum instances to be launched in auto scaling | number |  
| MaxSize | Max instances to be launched in auto scaling | number |
| RollingUpdateType | `Health` or `Immutable`. Set it to `Immutable` to apply the configuration change to a fresh group of instances" | string |
| DeploymentPolicy | Choose a deployment policy for application version deployments | | 
| BatchSizeType | The type of number that is specified in BatchSize. Fixed or Percentage | string |
| MinInstancesInService | Minimum number of instances in service during update | number |
| ELBscheme | Specify internal if you want to create an internal load balancer | |
| CrossZone | Configure the load balancer to route traffic evenly across all instances in all Availability Zones rather than only within each zone. | bool |
| StreamLogs | Whether to create groups in CloudWatch Logs for proxy and deployment logs, and stream logs from each instance in your environment | bool |
| AvailabilityZones |Choose the number of AZs for your instances. default=ANY  | string | 
| AssociatePublicIpAddress | Set the value to true if you want to include your load balancer and instances in a single public subnet | bool |