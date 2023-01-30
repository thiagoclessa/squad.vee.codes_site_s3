module "site" {
  source  = "./site_s3"

  domain              = local.config.domain
}


module "cloudfront" { 
    source = "./cloudfront" 
    domain = local.config.domain 
   
} 
