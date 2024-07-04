# Terraform Configuration Syntax

Terraform uses a configuration language to describe the infrastructure resources it manages. The syntax consists of a few key constructs: arguments, blocks, and expressions.

## Key Constructs

- **Arguments:** Assign values to specific names within a block. They appear in the form of `name = value`. Used to configure a particular resource. Many arguments are resource specific. Can be required or optional.
- **Attributes:** Values exposed by a particular resource. References to resource attributes takes the format `resource_type.resource_name.attribute_name`. Unlike arguments, which specify an infrastructure object´s configuration, a resource´s attributes are often assigned to them by the underlying cloud provider or API.
- **Meta-arguments:** Terraform specific arguments that change a resource type's behavior, and are not resource-specific.
- **Identifiers:** Argument names, block type names, and the names of most Terraform-specific constructs like resources, input variables, etc. are all identifiers.
Identifiers can contain letters, digits, underscores (_), and hyphens (-). The first character of an identifier must not be a digit, to avoid ambiguity with literal numbers.
- **Blocks:** Containers for other content and configuration. Blocks have a `type` and `labels`, and they can contain nested arguments and other blocks.
- **Comments:** The Terraform language supports three different syntaxes for comments:
    - `#` begins a single-line comment, ending at the end of the line.
    - `//` also begins a single-line comment, as an alternative to `#`.
    - `/*` and `*/` are start and end delimiters for a comment that might span over multiple lines.


### Example Structure

A typical Terraform configuration file includes multiple blocks, each specifying different aspects of the infrastructure. Here is a simplified example:

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 1.0.4"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {}
variable "base_cidr_block" {
  description = "A /16 CIDR range definition, such as 10.1.0.0/16, that the VPC will use"
  default = "10.1.0.0/16"
}

resource "aws_vpc" "main" {
  cidr_block = var.base_cidr_block
}
```

## Top-level blocks
Blocks that can appear outside of any other block in a TF config file. Most Terraform's features are implemented as top-level blocks.

### Fundamental blocks
- Terraform settings block: terraform settings
- Providers block: provider specific settings
- Resources block: resource to provision settings

### Variable blocks
Mainly to parameterize other blocks.

- Input variables block
- Output values block
- Local values block

### Calling/referencing blocks
- Data sources block
- Modules block