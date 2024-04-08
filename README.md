# AFT: Account customizations

This repository contains the [Account Factory for Terraform (AFT) account customizations](https://docs.aws.amazon.com/controltower/latest/userguide/aft-account-customization-options.html). As described in the [AFT Code Repositories](https://github.com/clearscale/tf-aws-aft?tab=readme-ov-file#aft-code-repositories) section in the main AFT repo, AFT is a [GitOps](https://en.wikipedia.org/wiki/DevOps#:~:text=referenced%20as%20examples.-,GitOps,rolled%20back%20using%20version%2Dcontrolling.) solution and this is one of the five repositories related to deploying and managing accounts in AWS.

## What belongs here?

The purpose of this repository is to facilitate account-specific customizations. For instance, when a new account is provisioned through AFT, there might be a requirement to deploy an IAM role to one account immediately upon its creation, whereas the same IAM role may not be necessary for another account. This illustrates the key application for the AFT Account Customization repository.

See also: [What belongs in AFT?](https://github.com/clearscale/tf-aws-aft?tab=readme-ov-file#what-belongs-in-aft) in the main AFT repository.

## What does *not* belong here?

Infrastructure as Code (IaC) scripts or code that are intended for universal application across all accounts should not be included here. See the [AFT Global Customization Repository](https://github.com/clearscale/tf-aws-aft-customization-global) for applying resources to all accounts. However, Non-essential or non-foundational resources related to not account setup are also outside the scope of all AFT repositories. The aim is to maintain the AFT framework with a minimal a footprint.

## Overview

The [AFT Accounts Repository](https://github.com/clearscale/tf-aws-aft-accounts) serves as the central hub for all account definitions within the AFT framework. It is the definitive source for the creation and management of accounts, where each account is meticulously defined using Terraform code. Within these definitions, the `account_customizations_name` parameter plays a critical role by linking to a specific directory name in this repository. This architecture allows for a streamlined approach where multiple account definitions can share a single customization name (directory). Consequently, any customization scripts contained within that directory are automatically applied to all associated accounts, ensuring a cohesive and efficient customization process across the AFT-managed accounts.

To apply account customizations:

1. Create a folder for an account customization. In your chosen repository, copy the `ACCOUNT_TEMPLATE` folder that AFT provides to a new folder. The name of your new folder should match the account_customizations_name that you provide in your account request.
2. Add the configurations to your specific account customizations folder You can add configurations to your account customizations folder based on the format of your configurations.
  - If your custom configurations are in the form of Python programs or scripts, place them under the `account_customizations_name/api_helpers/python` folder that's in your repository.
  - If your custom configurations are in the form of Bash scripts, place them under the `account_customizations_name/api_helpers` folder that's in your repository.
  - If your custom configurations are in the form of Terraform, place them under the `account_customizations_name/terraform` folder that's in your repository.
3. Refer to the specific `account_customizations_name` parameter in the account request file The AFT account request file includes the input parameter account_customizations_name. Enter the name of your account customization as the value for this parameter.

See: [The AWS Account Customization Options](https://docs.aws.amazon.com/controltower/latest/userguide/aft-account-customization-options.html) documentation or the [HashiCorp AFT tutorials page](https://developer.hashicorp.com/terraform/tutorials/aws/aws-control-tower-aft) for additional information.

## Customizations

The following customization directories have already been created and can be used as examples.

| Customization              | Details                                                                                            |
|----------------------------|----------------------------------------------------------------------------------------------------|
| dev                        | Example customization directory with VPC and automatic CIDR range detection and generation.        |
| prod                       | Example customization directory with VPC and automatic CIDR range detection and generation.        |
| default                    | General customization directory that does not require any specific labels or customizations.       |

## AFT Code Repositories

1. [Primary AFT Module](https://github.com/clearscale/tf-aws-aft)
2. [Account Definitions](https://github.com/clearscale/tf-aws-aft-accounts)
3. [Account Customizations](https://github.com/clearscale/tf-aws-aft-customization-account)
4. [Global Account Customizations](https://github.com/clearscale/tf-aws-aft-customization-global)
5. [Account Provisioning Customizations](https://github.com/clearscale/tf-aws-aft-customization-account-provisioning)