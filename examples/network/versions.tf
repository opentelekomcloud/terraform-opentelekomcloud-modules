terraform {
  required_providers {
    opentelekomcloud = {
      source  = "opentelekomcloud/opentelekomcloud"
      version = ">=1.34.4"
    }
  }
}

# Configure the OpenTelekomCloud Main Provider
provider "opentelekomcloud" {
  cloud = "terraform"
}
