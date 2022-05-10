# terraform_acm

Terraform module to create ACM certificates with email validation.

## Variables

``` terraform
domain: Main domain and name of the certificate
altnames: Alternative names for the certificate, like subdomains
region: Region in which the certificate should be created
```

## Terraform example

``` terraform
######################
# Certificates
######################
module "acm_example" {
  source   = "github.com/virsas/terraform_acm"
  domain   = "example.com"
  altnames = [ "*.example.com", "example.org", "*.example.org" ]
  region   = "us-east-1"
}
```
