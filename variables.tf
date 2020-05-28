# Data source for naming conventions
variable "naming_conventions_yaml_url" {
  description = "URL for naming conventions yaml file"
  type        = string
  default     = "https://raw.githubusercontent.com/openrba/python-azure-naming/master/custom.yaml" 
}

variable "naming_rules" {
  type = string
}

# Mandatory tags (https://github.com/openrba/python-azure-naming)
variable "business_unit" {
  description = "rba.businessUnit (https://github.com/openrba/python-azure-naming)"
  type        = string
}

variable "cost_center" {
  description = "rba.costCenter (https://github.com/openrba/python-azure-naming)"
  type        = string
}

variable "environment" {
  description = "rba.environment (https://github.com/openrba/python-azure-naming)"
  type        = string
}

variable "location" {
  description = "rba.azureRegion (https://github.com/openrba/python-azure-naming)"
  type        = string
}

variable "market" {
  description = "rba.market (https://github.com/openrba/python-azure-naming)"
  type        = string
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "subscription_type" {
  description = "rba.subscriptionType (https://github.com/openrba/python-azure-naming)"
  type        = string
}

# Optional tags
variable "on_prem" {
  description = "rba.onPrem (https://github.com/openrba/python-azure-naming)"
  type        = string
  default     = ""
}

variable "product_group" {
  description = "rba.productGroup (https://github.com/openrba/python-azure-naming) or [a-z0-9]{3,12}"
  type        = string
  default     = ""

  validation {
    condition     = length(regexall("[a-z0-9]{3,12}", var.product_group)) == 1
    error_message = "ERROR: product_group must [a-z0-9]{3,12}."
  }
}

variable "product_name" {
  description = "rba.productName (https://github.com/openrba/python-azure-naming)"
  type        = string
  default     = ""

  validation {
    condition     = length(regexall("[a-z0-9]{3,16}", var.product_name)) == 1
    error_message = "ERROR: product_name must be [a-z0-9]{3,16}."
  }
}

variable "project" {
  description = "Jira Project"
  type        = string
}

variable "resource_group_type" {
  description = "rba.resourceGroupType (https://github.com/openrba/python-azure-naming)"
  type        = string
}

variable "service_name" {
  description = "rba.serviceName (https://github.com/openrba/python-azure-naming)"
  type        = string
  default     = ""
}

variable "sre_team" {
  description = "SRE Team owner"
  type        = string
  default     = ""
}

variable "subnet_type" {
  description = "rba.subnetType (https://github.com/openrba/python-azure-naming)"
  type        = string
  default     = ""
}

variable "virtual_network_gateway_type" {
  description = "virtualNetGwType (https://github.com/openrba/python-azure-naming)"
  type        = string
  default     = ""
}

# Optional free-form tags
variable "additional_tags" {
  type        = map(string)
  description = "A map of additional tags to add to the tags output"
  default     = {}
}