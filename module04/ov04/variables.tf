# Øving 04 Her legges inn variabler som hentes fra main.tf 
variable "nsgname" {
  type = string
  description = "NSG Name"
  default = "nsg-oving-terraform"
  
}

variable "storage_account_names" {
  type        = list(string)
  description = "values for storage account names"
  default = [ "storage111", "storage222", "storage333"]
}


variable "company" {
  type        = string
  description = "Company name"
}

variable "project" {
  type        = string
  description = "Project name"
}

variable "billing_code" {
  type        = string
  description = "Billing name"
}

variable "location" {
  type        = string
  description = "Your resource is deployed here"
  default     = "West Europe"
}

variable "rgname" {
  type        = string
  description = "Resource groupe name"
  default     = "rg-oving-terraform"
}

variable "saname" {
  type        = string
  description = "Storage Account Name"
  default = "sa-oving-terraform"
}

variable "network1" {
  type = string
  description = "Nanv på nettverk1"
  
}

variable "network2" {
  type = string
  description = "Nanv på nettverk2"
  
}

variable "subnet1" {
  type = string
  description = "Navn på subnet1"
  default = "subnet1"
  
}

variable "address_prefixes1" {
  type = list(string)
  description = "IP verdi for Subnet1"
  
}
