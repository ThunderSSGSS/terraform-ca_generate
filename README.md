# AWS CA Generate Terraform module

Terraform module which creates a Self Signed Certificate and exports to ACM.

## Requirements
The module was tested using:
| Name | Versions |
|------|---------|
| terraform | >= 1.0 |
| aws provider | >= 3.0 |

## Usage

### Creating a CA with 2048 bits RSA key
```hcl
module "ca_example" {
    source          = "github.com/ThunderSSGSS/terraform-ca_generate"
    # Subjects
    common_name     = "CA_Example"
    organization    = "Example"
    # Acm tags
    name            = "CA_Example"
    # Expires
    days            = 360
}
```

### Creating a CA with 4096 bits RSA key
```hcl
module "ca_example" {
    source          = "github.com/ThunderSSGSS/terraform-ca_generate"
    rsa_key_bits    = 4096
    # Subjects
    common_name     = "CA_Example"
    organization    = "Example"
    # Acm tags
    name            = "My_CA"
    managed_by      = "Terraform"
    environment     = "prod"
    # Expires
    days            = 360
}
```

## Resources

| Name | Type |
|------|------|
| [tls_private_key.key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [tls_self_signed_cert.ca](https://registry.terraform.io/providers/hashicorp/tls/3.0.0/docs/resources/self_signed_cert) | resource |
| [aws_acm_certificate.cert](https://registry.terraform.io/providers/hashicorp/aws/3.11.0/docs/resources/acm_certificate) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Tag 'Name' on ACM | string | null | yes |
| environment | Tag 'Environment' on ACM | string | " " | no |
| managed_by | Tag 'Managed_by' on ACM | string | " " | no |
| rsa_key_bits | Number of bits on rsa private key | number | 2048 | no |
| common_name | Certificate Subject 'Common Name' | string | null | yes |
| organization | Certificate Subject 'Organization' | string | null | yes |
| days | Certificate valid period on days | number | 1 | no |

## Outputs

| Name | Description |
|------|-------------|
| cert_pem | Certificate Body |
| private_key_pem | Certificate private key |
| cert_arn | Certificate arn |


## DevInfos:
- Name: James Artur (Thunder);
- A DevOps and infrastructure enthusiastics.