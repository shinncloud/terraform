# ShinnCloud Terraform

ShinnCloud is a fictitious organization for demoing infrastructure tooling such as Terraform, Packer, and Google Cloud Platform. This repository houses Terraform to build infrastructure as code.

## Requirements

* Credentials for the `shinncloud` project.
* Terraform 0.12.2.

## Usage

The code here is broken up into two different Terraform projects. One for multiple workspaces where we can separate infrastructure into `test`, `staging`, and `production` environments. And another for shared infrastructure such as buckets, images, state, and other items used by other workspaces.

### Shared

The `shared` folder contains resources shared between workspaces:

Make sure the `shared` folder is your current working directory:

`cd shared`

Run `init` for the folder:

* `terraform init`

Then use the `plan` and `apply` workflow:

* `terraform plan`
* `terraform apply`

### Workspaces

The `workspaces` folder contains resources that run in each environment (such as instances, applications, GKE clusters).

Make sure the `workspaces` folder is your current working directory:

`cd workspaces`

Run `init` for the folder:

* `terraform init`

Then find a workspace to work in:

* `terraform workspace list`

Now use the `plan` and `apply` workflow:

* `terraform plan`
* `terraform apply`
