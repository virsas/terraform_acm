provider "aws" {
  region = var.region
}

resource "aws_acm_certificate" "acm" {
  domain_name               = var.domain
  subject_alternative_names = var.altnames
  validation_method         = "EMAIL"

  lifecycle {
    ignore_changes = all
  }
}