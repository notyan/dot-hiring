variable "project_id" {
  description = "project id used on this terraform"
  type = string
  default = "skillful-gizmo-382017"
}

variable "region" {
  description = "Region used"
  type = string
  default = "us-central1"
}

variable "zone" {
  description = "Zone used"
  type = string
  default = "us-central1-c"
}


variable "ssh_public_key" {
  description = "SSH public key for connecting to the instance"
  type = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDA/B7MfWq/Lv8DUzyxvoJDMIuE4PLYezgVrmYMg/29MSZG/rPWuvxoAzmMu/SV4HRYNHqbhmb3S1YLjChz/ge6nlRYc3GEOdEBJejPymkKjnIATffFe98PIY+LIQ0Els3B7u1WEwSVhSowwf04PHS2eir4nElsaoYriGAh5+y+liQf1+Y25CJtoitDpIk2fg0tUt85dw89R67f+SCx7rewoWsXeGhuxpN0agV6U1GarGLp88zHL+FphrZuYdTuiJ1x3R5NpB9okOUTl7Wt6Z5Lk0v5CMK3nNXcXQGYFhLs2Pnq7BIqNTJImCxwQE9iLJWOWUFje1tMpYZabxaongS8tp7kZ0dWUo+yzeefrWSln5uLuDU8fdlWh8vjDnKQusqqifaaXODos86hq1S9t+oKTGCNbzkef38ukdHoLE+rXJoU6dqhzw8KjBkLwMHzZn9WlqHu4Ty5siR/kxV6074p5CKmZQCN2HXOD6RNnYbOsnqibmrXh4SNqT5NedUvoH0= royan@notyan"
}

variable "ssh_user" {
  description = "SSH user"
  type = string
  default = "royan"
}

variable "ceSA" {
  description = "Service account for compute engine"
  type = string
  default = "serviceAccount:20489990413-compute@developer.gserviceaccount.com"
}