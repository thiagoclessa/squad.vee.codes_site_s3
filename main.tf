module "template_s3" {
  source  = "./template_s3"
  route53_zone_domain              = local.config.route53_zone_domain
  cdn_domain                       = local.config.cdn_domain
  id_zone                          = local.config.id_zone
  bucket                           = local.config.bucket
}