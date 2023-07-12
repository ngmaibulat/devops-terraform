### Best Practices

-   1: Manipulate state only through TF commands
-   2: Remote State
-   3: State Locking
-   4: Back up State File
-   5: Use 1 State per Environment
-   6: Host TF code in Git repository
-   7: CI for TF Code
-   8: Execute TF only in an automated build

### CI:

-   commit, push to branch
-   test
-   pull request, review
-   merge, run tf apply

### Donts:

-   Don't use local state
-   Don't apply manually
-   Don't skip testing, review
-   Don't provision manually via CLI, GUI, etc.
