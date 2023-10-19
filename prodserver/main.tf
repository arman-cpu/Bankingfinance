resource "aws_instance" "Prod_server" {
  ami           = "ami-0f5ee92e2d63afc18" 
  instance_type = "t2.micro" 
  key_name = "awsdevopskey"
  vpc_security_group_ids= ["sg-0a165e50fcc99827e"]
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("./awsdevopskey.pem")
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [ "echo 'wait to start instance' "]
  }
  tags = {
    Name = "Production_server"
  }
  provisioner "local-exec" {
        command = " echo ${aws_instance.Prod_server.public_ip} > inventory "
  }
   provisioner "local-exec" {
  command = "ansible-playbook /var/lib/jenkins/workspace/Bankingprj/prodserver/BankingPlaybook.yml "
  } 
}
