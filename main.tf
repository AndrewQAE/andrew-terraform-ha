resource "aws_launch_template" "andrew_ha_lt" {
  name_prefix   = "andrew-ha-lt-"
  image_id      = var.ami
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.andrew_app_ha_sg.id]
  }

  user_data = filebase64("userdata.sh")
  key_name  = var.key_name
  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_s3_instance_profile.id
  }

}

resource "aws_autoscaling_group" "andrew_ha_asg" {
  name                = "andrew-ha-asg"
  max_size            = 6
  min_size            = 3
  desired_capacity    = 3
  vpc_zone_identifier = var.subnet_ids
  launch_template {
    id      = aws_launch_template.andrew_ha_lt.id
    version = "$Latest"
  }
}
