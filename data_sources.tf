data "azurerm_subscription" "current" {}

locals {
  naming_rules = yamldecode(var.naming_rules)
  
  # Validate required inputs
  valid_business_unit                = can(local.naming_rules.businessUnit.allowed_values[var.business_unit]) ? null : file("ERROR: invalid input value for business_unit")
  valid_environment                  = can(local.naming_rules.environment.allowed_values[var.environment]) ? null : file("ERROR: invalid input value for environment")
  valid_location                     = can(local.naming_rules.azureRegion.allowed_values[var.location]) ? null : file("ERROR: invalid input value for location")
  valid_market                       = can(local.naming_rules.market.allowed_values[var.market]) ? null : file("ERROR: invalid input value for market")
  valid_cost_center                  = can(local.naming_rules.costCenter.allowed_values[var.cost_center]) ? null : file("ERROR: invalid input value for cost_center")
  valid_subscription_type            = can(local.naming_rules.subscriptionType.allowed_values[var.subscription_type]) ? null : file("ERROR: invalid input value for subscription_type")

  # Validate optional inputs
  valid_on_prem                      = var.on_prem == "" || can(local.naming_rules.onPrem.allowed_values[var.on_prem]) ? null : file("ERROR: invalid input value for on_prem")
  valid_resource_group_type          = var.resource_group_type == "" || can(local.naming_rules.resourceGroupType.allowed_values[var.resource_group_type]) ? null : file("ERROR: invalid input value for resource_group_type")
  valid_service_name                 = var.service_name == "" || can(local.naming_rules.serviceName.allowed_values[var.service_name]) ? null : file("ERROR: invalid input value for service_name")
  valid_virtual_network_gateway_type = var.virtual_network_gateway_type == "" || can(local.naming_rules.virtualNetGwType.allowed_values[var.virtual_network_gateway_type]) ? null : file("ERROR: invalid input value for virtual_network_gateway_type")

  # Do no validate inputs for sandboxes which need more flexibility
  valid_product_group                = var.environment == "sandbox" || var.product_group == "" || can(local.naming_rules.productGroup.allowed_values[var.product_group]) ? null : file("ERROR: invalid input value for product_group")
  valid_product_name                 = var.environment == "sandbox" || var.product_name == "" || can(local.naming_rules.productName.allowed_values[var.product_name]) ? null : file("ERROR: invalid input value for product_name")
}
