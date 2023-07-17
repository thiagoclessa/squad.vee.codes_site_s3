terraform { 
  backend "s3" { 
    bucket = "backend-squad" 
    key    = "teste/backend-squad.tfstate" 
    region = "us-east-1" 
  }
}
