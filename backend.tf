terraform { 
  backend "s3" { 
    bucket = "vkpr-teste" 
    key    = "teste/site.tfstate" 
    region = "us-east-1" 
  }
}