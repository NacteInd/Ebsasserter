provider "oci" {}
resource "null_resource" "remote-exec" {
  provisioner "file"{
    source = "${file("ebsasserter.sh")}"
    destination = "/home/opc/scripts/ebsasserter.sh"
    connection {
    type        = "ssh"
    host        = "${var.ebsasserter_ip}"
    user        = "opc"
    private_key = "${var.private_key}"
    }
  }
  provisioner "file"{
    source = "${file("python.py")}"
    destination = "/home/opc/scripts/python.py"
    connection {
    type        = "ssh"
    host        = "${var.ebsasserter_ip}"
    user        = "opc"
    private_key = "${var.private_key}"
    }
  }
    provisioner "file"{
    source = "${file("hostname.py")}"
    destination = "/home/opc/scripts/hostname.py"
    connection {
    type        = "ssh"
    host        = "${var.ebsasserter_ip}"
    user        = "opc"
    private_key = "${var.private_key}"
    }
  }
    provisioner "file"{
    source = "${file("bridge.properties")}"
    destination = "/home/opc/scripts/bridge.properties"
    connection {
    type        = "ssh"
    host        = "${var.ebsasserter_ip}"
    user        = "opc"
    private_key = "${var.private_key}"
    }
  }
    provisioner "file"{
    source = "${file("myDomain-ds.properties")}"
    destination = "/home/opc/scripts/myDomain-ds.properties"
    connection {
    type        = "ssh"
    host        = "${var.ebsasserter_ip}"
    user        = "opc"
    private_key = "${var.private_key}"
    }
  }
    provisioner "file"{
    source = "${file("create_data_source.py ")}"
    destination = "/home/opc/scripts/create_data_source.py "
    connection {
    type        = "ssh"
    host        = "${var.ebsasserter_ip}"
    user        = "opc"
    private_key = "${var.private_key}"
    }
  }
  provisioner "remote-exec" {   
    connection {
    type        = "ssh"
    host        = "${var.ebsasserter_ip}"
    user        = "opc"
    private_key = "${var.private_key}"
    }

    inline = [
      "sudo su -",
      "cd /home/opc/scripts/",
      "ls -a /",
      "sudo chmod 755 ebsasserter.sh",
      "echo ${var.ebs_url} ${var.app_serverid} ${var.IDCS_GUIID} ${var.weblogic_password} ${var.weblogic_url} ${var.admin_password} ${var.admin_url} ${var.ds_url} ${var.ds_drive} ${var.ds_username} ${var.ds_password} ${var.ds_targetname} ${var.clientid} ${var.secret} ${var.url_forjar}|./ebsasserter.sh",
      "python3 python.py"
    ]
  }
}
resource "null_resource" "remote-exec1" {
  provisioner "file"{
    source = "${file("ebsapplication.sh")}"
    destination = "/home/opc/scripts/ebsapplication.sh"
    connection {
    type        = "ssh"
    host        = "${var.ebsapp_ip}"
    user        = "opc"
    private_key = "${var.private_key}"
    }
  }
    provisioner "file"{
    source = "${file("python1.py")}"
    destination = "/home/opc/scripts/python1.py"
    connection {
    type        = "ssh"
    host        = "${var.ebsapp_ip}"
    user        = "opc"
    private_key = "${var.private_key}"
    }
  }
    provisioner "file"{
    source = "${var.private_key}"
    destination = "/home/opc/scripts/private.key"
    connection {
    type        = "ssh"
    host        = "${var.ebsapp_ip}"
    user        = "opc"
    private_key = "${var.private_key}"
    }
  }
  provisioner "remote-exec" {   
    connection {
    type        = "ssh"
    host        = "${var.ebsapp_ip}"
    user        = "opc"
    private_key = "${var.private_key}"
    }

    inline = [
      "sudo su -",
      "cd /home/opc/scripts/",
      "ls -a /",
      "sudo chmod 755 ebsapp.sh",
      "./ebsapp.sh",
      "python3 python1.py",
      "sudo scp -i private.key DBC.txt opc@${var.ebsasserter_ip}~:/",
      "sudo scp -i private.key EBSAsserter.zip opc@${var.ebsasserter_ip}~:/",
      "sudo scp -i private.key EBSDB_ebsasserter.example.com.dbc opc@${var.ebsasserter_ip}~:/
      ]
  }
}
