//Resource group
variable "resource-group-location" {
  type = string
}
variable "resource-group-name" {
  type = string
}
//vNet
variable "vNet-name" {
  type = string
}
variable "vNet-address-space" {
  type = string
}
//Security group
variable "security-group-name" {
  type = string
}
//Subnet
variable "SubNet-name" {
  type = string
}
variable "SubNet-address-prefixes" {
  type = string
}
//Tags
variable "tag-env" {
  type = string
}
variable "tag-name" {
  type = string
}

