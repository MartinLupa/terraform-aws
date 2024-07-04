# Terraform Workflow Commands

## Basic commands

### init
Initializes the configuration and prepares the working directory.
```bash
terraform init
```

### validate
Validates the configuration to ensure it is syntactically correct and internally consistent.
```bash
terraform validate
```

### plan
Creates an execution plan, showing what actions Terraform will take to reach the desired state.
```bash
terraform plan
```

### apply
Executes the actions proposed in the Terraform plan to achieve the desired state.
```bash
terraform apply
```

### destroy
Destroys the infrastructure managed by Terraform, reversing the `apply` command.
```bash
terraform destroy
```

