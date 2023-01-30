module "site" {
  source  = "./site_s3"

  domain              = local.config.domain
}


module "cloadfront" { 
    source = "./cloudfront " 
    domain = local.config.domain 
   
} 
