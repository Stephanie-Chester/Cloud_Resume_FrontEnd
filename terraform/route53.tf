resource "aws_acm_certificate" "mycert" {
  domain_name       = var.domain_name_root
  validation_method = "DNS"

  subject_alternative_names = [
    "*.stephaniechester.live",
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "my_cert_dns" {
  allow_overwrite = true
  name            = tolist(aws_acm_certificate.mycert.domain_validation_options)[0].resource_record_name
  records         = [tolist(aws_acm_certificate.mycert.domain_validation_options)[0].resource_record_value]
  type            = tolist(aws_acm_certificate.mycert.domain_validation_options)[0].resource_record_type
  zone_id         = aws_route53_zone.ns_record.zone_id
  ttl             = 60
}

resource "aws_acm_certificate_validation" "my_cert_validate" {
  certificate_arn         = aws_acm_certificate.mycert.arn
  validation_record_fqdns = [aws_route53_record.my_cert_dns.fqdn]
}

resource "aws_route53_zone" "ns_record" {
  name = "stephaniechester.live"
}

resource "aws_route53_record" "ns_record" {
  allow_overwrite = true
  name            = "stephaniechester.live"
  ttl             = 172800
  type            = "NS"
  zone_id         = aws_route53_zone.ns_record.zone_id

  records = [
    aws_route53_zone.ns_record.name_servers[0],
    aws_route53_zone.ns_record.name_servers[1],
    aws_route53_zone.ns_record.name_servers[2],
    aws_route53_zone.ns_record.name_servers[3],
  ]
}

resource "aws_route53_record" "www-a" {
  zone_id = aws_route53_zone.ns_record.zone_id
  name    = var.subdomain
  type    = "A"

  alias {
    name                   = "${aws_cloudfront_distribution.www_s3_distribution.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.www_s3_distribution.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "root-a" {
  zone_id = aws_route53_zone.ns_record.zone_id
  name    = var.domain_name_root
  type    = "A"

  alias {
    name                   = "${aws_cloudfront_distribution.root_s3_distribution.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.root_s3_distribution.hosted_zone_id}"
    evaluate_target_health = false
  }
}
