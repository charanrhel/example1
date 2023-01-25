output "cicd_ip" {
  value = aws_instance.ex_cicd.public_ip
}

output "cicd_dns" {
    value = aws_instance.ex_cicd.public_dns  
}

output "apache_ip" {
  value = aws_instance.apache.public_ip
}

output "apache_dns" {
  value = aws_instance.apache.public_dns
}