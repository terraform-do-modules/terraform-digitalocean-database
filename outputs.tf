# ------------------------------------------------------------------------------
# Outputs
# ------------------------------------------------------------------------------

output "database_cluster_id" {
  value       = digitalocean_database_cluster.cluster[*].id
  description = "The id of the database cluster"
}

output "database_cluster_urn" {
  value       = digitalocean_database_cluster.cluster[*].urn
  description = "The uniform resource name of the database cluster"
}

output "database_cluster_host" {
  value       = digitalocean_database_cluster.cluster[*].host
  description = "The hostname of the database cluster"
}

output "database_cluster_private_host" {
  value       = digitalocean_database_cluster.cluster[*].private_host
  description = "Same as host, but only accessible from resources within the account and in the same region"
}

output "database_cluster_port" {
  value       = digitalocean_database_cluster.cluster[*].port
  description = "Network port that the database cluster is listening on"
}

output "database_cluster_uri" {
  value       = digitalocean_database_cluster.cluster[*].uri
  sensitive   = true
  description = "The full URI for connecting to the database cluster"
}

output "database_cluster_default_database" {
  value       = digitalocean_database_cluster.cluster[*].database
  description = "Name of the cluster's default database"
}

output "database_cluster_default_user" {
  value       = digitalocean_database_cluster.cluster[*].user
  description = "Username for the cluster's default user"
}

output "database_cluster_default_password" {
  value       = digitalocean_database_cluster.cluster[*].password
  sensitive   = true
  description = "Password for the cluster's default user"
}

output "connection_pool_id" {
  value = {
    for k, pool in digitalocean_database_connection_pool.connection_pool : k => pool.id
  }
  description = "The ID of the database connection pool"
}

output "connection_pool_host" {
  value = {
    for k, pool in digitalocean_database_connection_pool.connection_pool : k => pool.host
  }
  description = "The hostname used to connect to the database connection pool"
}

output "connection_pool_private_host" {
  value = {
    for k, pool in digitalocean_database_connection_pool.connection_pool : k => pool.private_host
  }
  description = "Same as pool host, but only accessible from resources within the account and in the same region"
}

output "connection_pool_port" {
  value = {
    for k, pool in digitalocean_database_connection_pool.connection_pool : k => pool.port
  }
  description = "Network port that the database connection pool is listening on"
}

output "connection_pool_uri" {
  value = {
    for k, pool in digitalocean_database_connection_pool.connection_pool : k => pool.uri
  }
  sensitive   = true
  description = "The full URI for connecting to the database connection pool"
}

output "connection_pool_private_uri" {
  value = {
    for k, pool in digitalocean_database_connection_pool.connection_pool : k => pool.private_uri
  }
  sensitive   = true
  description = "Same as pool uri, but only accessible from resources within the account and in the same region"
}

output "connection_pool_password" {
  value = {
    for k, pool in digitalocean_database_connection_pool.connection_pool : k => pool.password
  }
  sensitive   = true
  description = "Password for the connection pool's user"
}

output "db_name" {
  value = [
    for db in digitalocean_database_db.database : db.name
  ]
  description = "The name for the database"
}

output "user_role" {
  value = {
    for k, user in digitalocean_database_user.user : k => user.role
  }
  description = "Role for the database user"
}

output "user_password" {
  value = {
    for k, user in digitalocean_database_user.user : k => user.password
  }
  sensitive   = true
  description = "Password for the database user"
}

output "database_firewall_id" {
  value       = digitalocean_database_firewall.firewall[*].id
  description = "A unique identifier for the firewall"
}

output "database_firewall_rule" {
  value = [
    for r in digitalocean_database_firewall.firewall[*].rule : r
  ]
  description = "A map with rule's uuid, type, value and created_at params"
}
