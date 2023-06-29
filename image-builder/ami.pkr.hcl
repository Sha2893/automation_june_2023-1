locals {
  image_name = "${var.app_name}-packer-lwplabs"
}

# data "amazon-ami" "this" {
#     filters = {
#         virtualization-type = "hvm"
#         name = "al2023-ami-2023-*"
#         root-device-type = "ebs"
#     }
#     owners = ["137112412989"]
#     most_recent = true
#     region   = "us-east-1"
# }

source "amazon-ebs" "this" {
  assume_role {
    role_arn     = "arn:aws:iam::520464532822:role/stsassumerole"
    session_name = "packer-session"
  }
  region        = var.region
  source_ami    = "ami-06b09bfacae1453cb"
  instance_type = var.instance_type
  ssh_username  = var.ssh_user_name
  ami_name      = local.image_name
}

build {
  sources = [
    "source.amazon-ebs.this"
  ]

  provisioner shell {
    inline = [
      "sudo yum update -y",
      "sudo yum install httpd -y",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
      "sudo echo '<h1>Welcome to Terraform class at learnwithproject</h1>'|sudo tee /var/www/html/index.html"
    ]
  }
}
