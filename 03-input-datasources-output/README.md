# Terraform state

Source: https://developer.hashicorp.com/terraform/language/state

Terraform must store state about your managed infrastructure and configuration. This state is used by Terraform to map real world resources to your configuration, keep track of metadata, and to improve performance for large infrastructures.

This state is stored by default in a local file named "terraform.tfstate", but we recommend storing it in HCP Terraform to version, encrypt, and securely share it with your team.

Terraform uses state to determine which changes to make to your infrastructure. Prior to any operation, Terraform does a refresh to update the state with the real infrastructure.

The primary purpose of Terraform state is to store bindings between objects in a remote system and resource instances declared in your configuration. When Terraform creates a remote object in response to a change of configuration, it will record the identity of that remote object against a particular resource instance, and then potentially update or delete that object in response to future configuration changes.

## State purpose
State is a necessary requirement for Terraform to function.

Terraform requires some sort of database to map Terraform config to the real world. For example, when you have a resource resource "aws_instance" "foo" in your configuration, Terraform uses this mapping to know that the resource resource "aws_instance" "foo" represents a real world object with the instance ID i-abcd1234 on a remote system.

For some providers like AWS, Terraform could theoretically use something like AWS tags. Early prototypes of Terraform actually had no state files and used this method. However, we quickly ran into problems. The first major issue was a simple one: not all resources support tags, and not all cloud providers support tags.

Therefore, for mapping configuration to resources in the real world, Terraform uses its own state structure.

Terraform expects that each remote object is bound to only one resource instance in the configuration. If a remote object is bound to multiple resource instances, the mapping from configuration to the remote object in the state becomes ambiguous, and Terraform may behave unexpectedly. Terraform can guarantee a one-to-one mapping when it creates objects and records their identities in the state. When importing objects created outside of Terraform, you must make sure that each distinct object is imported to only one resource instance.