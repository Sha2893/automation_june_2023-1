resource "null_resource" "provisioner" {
  triggers = {
    always_run = timestamp()
  }
  depends_on = [aws_instance.bastion]

  connection {
    host        = aws_instance.bastion.public_ip
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("${path.module}/../keypair")
  }

  #   provisioner "local-exec" {
  #     command = "scp -o StrictHostKeyChecking=no -i ~/Downloads/test.pem ~/Downloads/test.pem ec2-user@${aws_instance.bastion.public_ip}:~"
  #   }

  provisioner "file" {
    # source      = "~/keypair"
    content     = var.mykey
    destination = "/home/ec2-user/mykey"
  }


  provisioner "remote-exec" {
    inline = [
      "chmod 400 mykey"
    ]
  }

}