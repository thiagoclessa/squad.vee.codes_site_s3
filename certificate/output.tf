output "vca" {
  value = "${aws_acm_certificate_validation.certificate_validation.certificate_arn}"
}