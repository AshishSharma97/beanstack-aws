locals {
  tags= {

   Name = "VPC tag"
    
  }
   elb_settings = [

     {
       namespace = "aws:elb:loadbalancer"
       name = "CrossZone"
       value = "${var.CrossZone}"
    },
 
    {
      namespace = "aws:elb:policies"
      name = "ConnectionDrainingEnabled"
      value = "true"
    },

    {
      namespace = "aws:elb:listener:443"
      name = "ListenerProtocol"
      value = "HTTPS"
    },

    {
      namespace = "aws:elb:listener:443"
      name = "InstanceProtocol"
      value = "HTTP"
    },

    {
      namespace = "aws:elb:listener:443"
      name = "InstancePort"
      value = "80"
    },

    {
      namespace = "aws:elb:listener:443"
      name = "ListenerEnabled"
      value = "false"
    }
    
  ]
elb_settings_final =  "${local.elb_settings}"

  }











