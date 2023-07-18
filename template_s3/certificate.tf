resource "aws_acm_certificate" "certificate" {
  domain_name       = var.cdn_domain
  validation_method = "DNS"
}

resource "aws_acm_certificate_validation" "certificate_validation" {
  certificate_arn         = aws_acm_certificate.certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.certificate_records : record.fqdn]

  depends_on = [
    aws_acm_certificate.certificate
  ]

  timeouts {
    create = "20m"
  }
}

# Add Certificate Validation Records on Route53
resource "aws_route53_record" "certificate_records" {
  for_each = {
    for dvo in aws_acm_certificate.certificate.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = var.id_zone
}