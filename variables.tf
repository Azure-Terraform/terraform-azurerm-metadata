variable "naming_rules" {
  description = "naming conventions yaml file" 
  type        = string
}

# Mandatory tags (https://github.com/Azure-Terraform/example-naming-template)
variable "business_unit" {
  description = "rba.businessUnit (https://github.com/Azure-Terraform/example-naming-template#custombusinessunit)"
  type        = string
}

variable "environment" {
  description = "rba.environment (https://github.com/Azure-Terraform/example-naming-template#customenvironment)"
  type        = string
}

variable "location" {
  description = "rba.azureRegion (https://github.com/Azure-Terraform/example-naming-template#customazureregion)"
  type        = string
}

variable "market" {
  description = "rba.market (https://github.com/Azure-Terraform/example-naming-template#custommarket)"
  type        = string
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "subscription_type" {
  description = "rba.subscriptionType (https://github.com/Azure-Terraform/example-naming-template#customsubscriptiontype)"
  type        = string
}

# Optional tags
variable "on_prem" {
  description = "rba.onPrem (https://github.com/Azure-Terraform/example-naming-template#customonprem)"
  type        = string
  default     = ""
}

variable "product_group" {
  description = "rba.productGroup (https://github.com/Azure-Terraform/example-naming-template#customproductgroup) or [a-z0-9]{2,12}"
  type        = string

  validation {
    condition     = length(regexall("[a-z0-9]{2,12}", var.product_group)) == 1
    error_message = "ERROR: product_group must [a-z0-9]{2,12}."
  }
}

variable "product_name" {
  description = "rba.productName (https://github.com/Azure-Terraform/example-naming-template#customproductname)"
  type        = string

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
  description = "rba.resourceGroupType (https://github.com/Azure-Terraform/example-naming-template#customresourcegrouptype)"
  type        = string
}

variable "service_name" {
  description = "rba.serviceName (https://github.com/Azure-Terraform/example-naming-template#customservicename)"
  type        = string
  default     = ""
}

variable "sre_team" {
  description = "SRE Team owner"
  type        = string
  default     = ""
}

variable "subnet_type" {
  description = "rba.subnetType (https://github.com/Azure-Terraform/example-naming-template#customsubnettype)"
  type        = string
  default     = ""
}

variable "virtual_network_gateway_type" {
  description = "virtualNetGwType (https://github.com/Azure-Terraform/example-naming-template#customvirtualnetgwtype)"
  type        = string
  default     = ""
}

# Optional free-form tags
variable "additional_tags" {
  type        = map(string)
  description = "A map of additional tags to add to the tags output"
  default     = {}
}
