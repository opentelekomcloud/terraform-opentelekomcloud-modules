/*=================================
PROVIDER SETTINGS
==================================*/
terraform {
  required_providers {
    opentelekomcloud = {
      source  = "opentelekomcloud/opentelekomcloud"
      version = ">=1.35.0"
    }
  }
}

provider "opentelekomcloud" {
  cloud = "eu-de"
}
