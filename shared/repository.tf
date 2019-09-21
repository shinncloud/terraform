resource "google_sourcerepo_repository" "packer" {
  name = "packer"
}

resource "google_sourcerepo_repository" "terraform" {
  name = "terraform"
}
