locals { 

  # Global Tags
  default_tags = {
    terraform = "true"
    provider  = "azurerm"
  }

  # Azure Region
  location = local.naming_rules.azureRegion.allowed_values[var.location]

  # Naming metadata
  names = merge(
    {
      business_unit     = var.business_unit
      environment       = var.environment
      location          = var.location
      market            = var.market
      subscription_type = var.subscription_type
    },
    var.on_prem != "" ? {on_prem = var.on_prem} : {},
    var.product_group != "" ? {product_group = var.product_group} : {},
    var.product_name != "" ? { product_name = var.product_name} : {},
    var.resource_group_type != "" ? {resource_group_type = var.resource_group_type} : {},
    var.service_name != "" ? {service_name = var.service_name} : {},
    var.subnet_type != "" ? {subnet_type = var.subnet_type} : {},
    var.virtual_network_gateway_type != "" ? {virtual_network_gateway_type = var.virtual_network_gateway_type} : {},
  )

  # Tagging metadata
  tags = merge(
    {
      business_unit     = local.naming_rules.businessUnit.allowed_values[var.business_unit]
      cost_center       = var.cost_center
      environment       = local.naming_rules.environment.allowed_values[var.environment]
      location          = local.naming_rules.azureRegion.allowed_values[var.location]
      market            = local.naming_rules.market.allowed_values[var.market]
      subscription_id   = var.subscription_id
      subscription_type = local.naming_rules.subscriptionType.allowed_values[var.subscription_type]
    },
    var.on_prem != "" ? {on_prem = local.naming_rules.onPrem.allowed_values[var.on_prem]} : {},
    var.product_group != "" ? {product_group = lookup(local.naming_rules.productGroup.allowed_values, var.product_group, var.product_group)} : {},
    var.product_name != "" ? {product_name = lookup(local.naming_rules.productName.allowed_values, var.product_name, var.product_name)} : {},
    var.resource_group_type != "" ? {resource_group_type = local.naming_rules.resourceGroupType.allowed_values[var.resource_group_type]} : {},
    var.service_name != "" ? {service_name = local.naming_rules.serviceName.allowed_values[var.service_name]} : {},
    var.sre_team != "" ? {sre_team = var.sre_team} : {},
    var.subnet_type != "" ? {subnet_type = local.naming_rules.subnetType.allowed_values[var.subnet_type]} : {},
    var.virtual_network_gateway_type != "" ? {virtual_network_gateway_type = local.naming_rules.virtualNetGwType.allowed_values[var.virtual_network_gateway_type]} : {},
    var.additional_tags,
    local.default_tags,
  )

}