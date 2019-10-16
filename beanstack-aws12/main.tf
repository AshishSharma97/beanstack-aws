resource "aws_elastic_beanstalk_application" "app" {
  name = "${var.app_name}"
  description = "${var.app_description}"
}
resource "aws_elastic_beanstalk_application_version" "default" {
  name        = "beanstack_application-version"
  application = "${var.app_name}"
  description = "application version created by terraform"
  bucket      = "${var.bucket_name}"
  key         = "${var.key}"
}

resource "aws_elastic_beanstalk_environment" "app-prod" {
  name = "${var.env_name}"
  application = "${aws_elastic_beanstalk_application.app.name}"
  solution_stack_name = "${var.solution_stack_name}"
  
   dynamic "setting" {
    for_each = "${local.elb_settings_final}"
    content {
      namespace = setting.value["namespace"]
      name      = setting.value["name"]
      value     = setting.value["value"]
    }
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "${data.aws_vpc.vpc.id}"
  }
  
  setting {
      namespace = "aws:ec2:vpc"
      name  = "AssociatePublicIpAddress"
      value = "${var.AssociatePublicIpAddress}"
    }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "subnets"
    value     = "${data.aws_subnet.subnet.id}"
   }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = "${aws_security_group.app-dev.id}"
    } 

  setting {
    namespace = "aws:autoscaling:launchconfiguration" 
    name = "IamInstanceProfile"
    value = "${aws_iam_instance_profile.app-ec2-role.name}"
    }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "${var.EnvironmentType}"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "${var.InstanceType}"
    }
    
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = "${aws_iam_role.elasticbeanstalk-service-role.name}"
    }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "BASE_HOST"
    value     = "${var.BASE_HOST}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_READ_ONLY_NAME"
    value     = "read_only"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_READ_ONLY_PW"
    value     = "o0Pp6&df7ky0lUi@%ZsNepasfasfasfasf"
  }

  setting {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name      = "SystemType"
    value     = "${var.SystemType}"
  }

# autoscaling group- Modify Capacity

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "Availability Zones"
    value     = "${var.AvailabilityZones}"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = "${var.MinSize}"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = "${var.MaxSize}"
  }
   
## rolling updates

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "DeploymentPolicy"
    value     = "${var.DeploymentPolicy}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "BatchSizeType"
    value     = "${var.BatchSizeType}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "BatchSize"
    value     = "${var.BatchSize}"
  }
  
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "MaxBatchSize"
    value     = "${var.MaxBatchSize}"
  }

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "MinInstancesInService"
    value     = "${var.MinInstancesInService}"
  }

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateEnabled"
    value     = "${var.RollingUpdateEnabled}"
    }

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateType"
    value     = "${var.RollingUpdateType}"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBscheme"
    value     = "${var.ELBscheme}"
    }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    value     = "${data.aws_subnet.subnet.id}"
    }

  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name      = "StreamLogs"
    value     = "${var.StreamLogs}"
  }
   
}
