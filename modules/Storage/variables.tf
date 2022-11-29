//Security group
variable "resource-group-location" {
  type = string
}
variable "resource-group-name" {
  type = string
}
//Storage account
variable "storage-account-name" {
  type = string
}
variable "account-tier" {
  type = string
}
variable "account-replication-type" {
  type = string
}
//Storage container
variable "storage-container-name" {
  type = string
}
variable "storage-container-access-type" {
  type = string
}
//Tags
variable "tag-env" {
  type = string
}
variable "tag-name" {
  type = string
}