

resource "aws_key_pair" "terraform-demo" {
  key_name   = "terraform-demo"
  public_key = file("~/.ssh/gurubox.pub")
}
