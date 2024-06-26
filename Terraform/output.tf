output "server_public_ip" {
  value = aws_eip.web-eip.public_ip
}

resource "null_resource" "store_public_ip" {
  provisioner "local-exec" {
    command = "echo '${aws_eip.web-eip.public_ip}' > public_ip.txt"
  }
}

output "server_privet_ip" {
  value = aws_instance.web-server-instance.private_ip
}

resource "local_file" "private_key_pem" {
  content  = module.key_pair.private_key_pem
  filename = "key.pem"
}