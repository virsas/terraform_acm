provider "aws" {
  region = var.region
}

resource "aws_acm_certificate" "acm" {
  domain_name               = var.domain
  subject_alternative_names = var.altnames
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "acm_records" {
  for_each = {
    for dvo in aws_acm_certificate.acm.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 30
  type            = each.value.type
  zone_id         = var.zone
}