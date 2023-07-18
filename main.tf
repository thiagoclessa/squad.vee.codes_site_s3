module "template_s3" {
  source  = "./template_s3"
  route53_zone_domain              = local.config.domain
  cdn_domain                       = local.config.cdn
  zone_id                          = local.zone_id
}