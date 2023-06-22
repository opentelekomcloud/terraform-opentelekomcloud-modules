terraform {
  required_version = ">= 1.0"
  
  required_providers {
    opentelekomcloud = {
      source  = "opentelekomcloud/opentelekomcloud"
      version = ">=1.34.4"
    }
  }
}
