terraform { 
  backend "s3" { 
    bucket = "backend-squad/homolog" 
    key    = "backend-squad.tfstate" 
    region = "us-east-1" 
  }
}
