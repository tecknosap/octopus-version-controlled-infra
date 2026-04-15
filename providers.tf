terraform {
  required_providers {
    octopusdeploy = {
      source  = "OctopusDeploy/octopusdeploy"
      version = "1.10.3"
    }
  }
}

provider "octopusdeploy" {
  # Configuration options
   address  = var.address
  api_key  = var.api_key
  space_id = var.space_id
}