-   console Try Terraform expressions at an interactive command prompt

-   force-unlock Release a stuck lock on the current workspace

-   get Install or upgrade remote Terraform modules

-   graph Generate a Graphviz graph of the steps in an operation

-   import Associate existing infrastructure with a Terraform resource

-   login Obtain and save credentials for a remote host
-   logout Remove locally-stored credentials for a remote host

-   metadata Metadata related commands

-   output Show output values from your root module
-   providers Show the providers required for this configuration
-   refresh Update the state to match remote systems

-   show Show the current state or a saved plan

-   state Advanced state management

-   taint Mark a resource instance as not fully functional
-   untaint Remove the 'tainted' state from a resource instance

-   workspace Workspace management

```bash
terraform graph | dot -Tsvg > graph.svg
```

```bash
terraform import aws_instance.example i-0abc1234def5678z9
```

```bash
terraform state list
terraform state show local_file.demo
terraform state mv aws_instance.old aws_instance.new
terraform state pull > terraform.tfstate
terraform state rm aws_instance.example
terraform state replace-provider registry.example.com/examplecorp/example
terraform state push file.terraform.tfstate
```

```bash
terraform taint aws_instance.my_instance
terraform untaint aws_instance.my_instance
```

```bash
terraform metadata functions -json | jq
```
