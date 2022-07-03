terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}


provider "digitalocean" {
    token = var.DOTOKEN
}

data "digitalocean_ssh_key" "do_infra" {
  name = "do_infra"
}

resource "digitalocean_droplet" "dev" {
    image = "ubuntu-20-04-x64"
    name = "dev"
    region = "nyc3"
    size = "s-1vcpu-1gb"
    ssh_keys = [
      data.digitalocean_ssh_key.do_infra.id
    ]
}