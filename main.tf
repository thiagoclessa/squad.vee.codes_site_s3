module "site" {
  source  = "./site_s3"

  domain              = local.config.domain
}


module "cloadfront" { 
    souce = "./cloudfront " 
     domain = local.config.domain 
   
} 
