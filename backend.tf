terraform { 
  backend "s3" { 
    bucket = "backend-squad" 
    key    = "backend-squad.tfstate" 
    region = "us-east-1" 
  }
}