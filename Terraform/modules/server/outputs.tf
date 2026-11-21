output "jenkins_instance_id" {
  description = "ID of the Jenkins EC2 instance."
  value       = aws_instance.jenkins.id
}

output "jenkins_public_ip" {
  description = "Public IP address of the Jenkins EC2 instance."
  value       = aws_instance.jenkins.public_ip
}

output "jenkins_url" {
  description = "URL of the Jenkins web console."
  value       = "http://${aws_instance.jenkins.public_ip}:8080"
}

output "jenkins_security_group_id" {
  description = "ID of the Jenkins security group."
  value       = aws_security_group.jenkins.id
}
