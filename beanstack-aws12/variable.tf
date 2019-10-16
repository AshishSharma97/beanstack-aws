variable "region" {
description = "AWS region"
}

variable "vpc_id" {
description = "VPC CIDR"
}

variable "subnet_id" {
description = "Subnet CIDR"
}

variable "destination_cidr" {
description = "destination CIDR for IG"
}

variable "bucket_name" {
description = "Bucket name in which code is present"
}

variable "key" {
description= "source of zip code file"
}
variable "app_name" {
description = "application name of EB"
}

variable "app_description" {
description = "application description of eb"
}

variable "env_name" {
description = "env name of EB"
}

variable "solution_stack_name" {
description = "A solution stack to base your environment off"
}

variable "EnvironmentType" {
description = "Environment type, e.g. 'LoadBalanced' or 'SingleInstance'.  If setting to 'SingleInstance', `rolling_update_type` must be set to 'Time"
}

variable "InstanceType" {
description = "Instances type"   
}

variable "BASE_HOST" {
 description = "environment properties" 
}

variable "SystemType" {
description = "Whether to enable \"enhanced\" health reporting for this environment.  If false, \"basic\" reporting is used.  When you set this to false, you must also set `enable_managed_actions` to false" 
}

variable "MinSize" {
  description = "Minimum instances to be launched in auto scaling"  
}

variable "MaxSize" {
  description = "Max instances to be launched in auto scaling" 
}

variable "RollingUpdateEnabled" {
type        = bool
description = "Whether to enable rolling update" 
}

variable "RollingUpdateType" {
type        = string
description = "`Health` or `Immutable`. Set it to `Immutable` to apply the configuration change to a fresh group of instances"
}

variable "DeploymentPolicy" {
description = "Choose a deployment policy for application version deployments."
}

variable "BatchSizeType" {
description = "The type of number that is specified in BatchSize. Fixed or Percentage" 
}

variable "MaxBatchSize" {
type        = number
description = "Maximum number of instances to update at once"  
}

variable "BatchSize" {
description = "Percentage or fixed number of Amazon EC2 instances in the Auto Scaling group "  
}

variable "MinInstancesInService" {
type        = number
description = "Minimum number of instances in service during update"  
}

variable "ELBscheme" {
description = "Specify internal if you want to create an internal load balancer" 
}

variable "CrossZone" {
type        = bool
default     = "true"
description = "Configure the load balancer to route traffic evenly across all instances in all Availability Zones rather than only within each zone."
}

variable "StreamLogs" {
 type         = bool
  description = "Whether to create groups in CloudWatch Logs for proxy and deployment logs, and stream logs from each instance in your environment" 
}

variable "AvailabilityZones" {
description = "Choose the number of AZs for your instances. default=ANY"  
}

variable "AssociatePublicIpAddress" {
default     = "true"
description = "Set the value to true if you want to include your load balancer and instances in a single public subnet." 
}

