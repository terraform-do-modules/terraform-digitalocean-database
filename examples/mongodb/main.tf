provider "digitalocean" {}

locals {
  name        = "app"
  environment = "test"
  region      = "blr1"
}

##------------------------------------------------
## VPC module call
##------------------------------------------------
module "vpc" {
  source      = "terraform-do-modules/vpc/digitalocean"
  version     = "1.0.0"
  name        = local.name
  environment = local.environment
  region      = local.region
  ip_range    = "10.10.0.0/16"
}

##------------------------------------------------
## mongodb database cluster module call
##------------------------------------------------
module "mongodb" {
  source                       = "../../"
  name                         = local.name
  environment                  = local.environment
  region                       = local.region
  cluster_engine               = "mongodb"
  cluster_version              = "6"
  cluster_size                 = "db-s-1vcpu-1gb"
  cluster_node_count           = 1
  cluster_private_network_uuid = module.vpc.id
  cluster_maintenance = {
    maintenance_hour = "02:00:00"
    maintenance_day  = "saturday"
  }
  databases = ["testdb"]
  users = [
    {
      name = "test"
    }
  ]

  create_firewall = false
  firewall_rules = [
    {
      type  = "ip_addr"
      value = "0.0.0.0"
    }
  ]
}
