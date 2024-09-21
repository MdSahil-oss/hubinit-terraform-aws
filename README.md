## Usage

This repository hosts terraform configurations for AWS resources Management.

## Why this repository has modular structure?

This repository has modular structure because of following reasons:

- To manage resources in AWS separately like `s3`, `ec2`, `vpc` and others.
- To manage resources in AWS in groups of `dev`, `staging` and `prod` where a set of resources deployed & managed at once.

So, overall such arrangement of terraform config files give us more flexiblity. To get more details on it please visit [on this link.](https://www.hashicorp.com/blog/structuring-hashicorp-terraform-configuration-for-production)
