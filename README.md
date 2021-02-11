# Azure - Metadata Module

## Introduction

This module will return a map of mandatory tag for resources in Azure.<br />
<br />
It is recommended that you always use this module to generate tags as it will prevent code duplication. We also reccommend leveraging this data as "metadata" to determine core details about resources in other modules.

- For example the location output can be referenced when creating a virtual machine. If you want to change regions at a later date you only need to update one place.<br />

Where applicable, the inputs will be checked against the input naming rules for Azure.

- https://github.com/Azure-Terraform/example-naming-template/<br />

<!--- BEGIN_TF_DOCS --->
<!--- END_TF_DOCS --->