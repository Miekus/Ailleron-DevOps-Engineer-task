//Resource Group
variable "resource-group-location" {
  type = string
}
variable "resource-group-name" {
  type = string
}
// AKS
variable "aks-name" {
  type = string
}
variable "dns-prefix" {
  type = string
}
variable "identity-type" {
  type = string
}
//Network profile
variable "network-plugin" {
  type = string
}
variable "dns-service-ip" {
  type = string
}
variable "docker-bridge-cidr" {
  type = string
}
variable "service-cidr" {
  type = string
}
//Auto-scaler profile
variable "scale-down-utilization-threshold" {
  type = string
}
variable "skip-nodes-with-system-pods" {
  type = bool
}
variable "skip-nodes-with-local-storage" {
  type = bool
}
//RBAC
variable "role-based-access-control" {
  type = bool
}
//Node pool
variable "node-pool-name" {
  type = string
}
variable "node-pool-autoscaling" {
  type = bool
}
variable "node-pool-minimum" {
  type = string
}
variable "node-pool-maximum" {
  type = string
}
variable "node-os-disk-size-gb" {
  type = string
}
variable "node-pool-vm-size" {
  type = string
}
variable "node-pool-zones" {
  type = list(string)
}
variable "vnet-recruitment-subnet-id" {
  type = string
}

// Tags
variable "tag-env" {
  type = string
}
variable "tag-name" {
  type = string
}
