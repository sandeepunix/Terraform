data "template_file" "shell-script" {
  template = "${file("scripts/myscript.sh")}"
}
data "template_cloudinit_config" "webserver" {

  gzip = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.shell-script.rendered}"
  }

}
