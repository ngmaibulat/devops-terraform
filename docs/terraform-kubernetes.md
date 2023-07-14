### Unified Workflow

If an organization is already using Terraform to manage other infrastructure, it can be advantageous to also manage Kubernetes with Terraform. This provides a consistent workflow and unified approach to infrastructure management. The same practices used for managing infrastructure like version control, peer review, and continuous delivery can be applied to Kubernetes resources.

### Resource Dependency Management

Terraform excels at managing dependencies between resources. For example, if a Kubernetes cluster needs to interact with a cloud-based database, Terraform can manage the creation of both resources and ensure they are created in the correct order with the correct information. Without Terraform, you may have to manage this process manually or with scripts.

### Steps:

-   Deploy resources, such as Databases. Which are not managed by Kubernetes.
-   Deploy Kubernetes Cluster
-   Deploy Resources inside Kubernetes Cluster
-   Keep managing Kubernetes via Kubernetes tools
