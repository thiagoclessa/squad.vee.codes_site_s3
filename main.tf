module "template_s3" {
  source  = "./template_s3"
  route53_zone_domain              = local.config.domain
  cdn_domain                       = local.config.cdn
  id_zone                          = local.config.id_zone
}