# Default Account Directory

All [account definitions](https://github.com/clearscale/tf-aws-aft-accounts/tree/main/terraform) can point to this directory by specifying `account_customizations_name = "default"` if the account does not have any specific customizations. Any general Terraform resources in this defined directory will be applied.

