# terraform-digitalocean-database — Inputs and Outputs

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `name` | Name (e.g. `app` or `cluster`). | `string` | `""` | no |
| `environment` | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| `label_order` | Label order, e.g. `name`, `application`. | `list(any)` | `["name", "environment"]` | no |
| `managedby` | ManagedBy, e.g. `terraform-do-modules` or `hello@clouddrove.com`. | `string` | `"terraform-do-modules"` | no |
| `enabled` | Flag to control the resources creation. | `bool` | `true` | no |
| `cluster_engine` | Database engine used by the cluster (`pg`, `mysql`, `redis`, `mongodb`). | `string` | `""` | no |
| `cluster_version` | The version of the cluster. | `string` | `""` | no |
| `cluster_size` | Database Droplet size associated with the cluster (e.g. `db-s-1vcpu-1gb`). | `string` | `"db-s-1vcpu-1gb"` | no |
| `region` | DigitalOcean region where the cluster will reside. | `string` | `null` | no |
| `replica_region` | DigitalOcean region where the replica will reside. | `string` | `null` | no |
| `cluster_node_count` | Number of nodes that will be included in the cluster. | `number` | `1` | no |
| `cluster_private_network_uuid` | The ID of the VPC where the database cluster will be located. | `string` | `null` | no |
| `redis_eviction_policy` | Eviction policy for a Redis cluster. Valid values: `noeviction`, `allkeys_lru`, `allkeys_random`, `volatile_lru`, `volatile_random`, `volatile_ttl`. | `string` | `null` | no |
| `mysql_sql_mode` | A comma-separated string specifying the SQL modes for a MySQL cluster. | `string` | `null` | no |
| `cluster_maintenance` | The day and the start hour of the maintenance window policy (`maintenance_hour`, `maintenance_day`). | `map(string)` | `null` | no |
| `backup_restore` | Restore from backup settings (`database_name`, `backup_created_at`). | `map(string)` | `null` | no |
| `databases` | A list of databases to create in the cluster. | `list(string)` | `[]` | no |
| `users` | A list of user maps to create in the cluster. Each map supports `name` and optionally `mysql_auth_plugin`. | `list(map(string))` | `null` | no |
| `create_pools` | Controls if connection pools should be created. | `bool` | `false` | no |
| `pools` | A list of connection pool maps (`name`, `mode`, `size`, `db_name`, `user`). | `list(map(string))` | `null` | no |
| `create_firewall` | Controls if a firewall should be created for the cluster. | `bool` | `false` | no |
| `firewall_rules` | List of firewall rule maps (`type`, `value`). | `list(map(string))` | `[]` | no |
| `project_id` | The ID of the project the cluster is assigned to. | `string` | `null` | no |
| `replica_size` | Database Droplet size for the replica (e.g. `db-s-1vcpu-1gb`). Can only be increased after creation. | `string` | `"db-s-1vcpu-1gb"` | no |
| `replica_enable` | Flag to control read replica creation. | `bool` | `false` | no |
| `storage_size_mib` | Disk size in MiB allocated to the cluster. | `string` | `null` | no |

---

## Outputs

| Name | Description |
|------|-------------|
| `database_cluster_id` | The ID of the database cluster. |
| `database_cluster_urn` | The uniform resource name of the database cluster. |
| `database_cluster_host` | The hostname of the database cluster. |
| `database_cluster_private_host` | The private hostname of the database cluster (accessible only within the same account and region). |
| `database_cluster_port` | Network port the database cluster is listening on. |
| `database_cluster_uri` | The full URI for connecting to the database cluster. *(sensitive)* |
| `database_cluster_default_database` | Name of the cluster's default database. |
| `database_cluster_default_user` | Username for the cluster's default user. |
| `database_cluster_default_password` | Password for the cluster's default user. *(sensitive)* |
| `connection_pool_id` | Map of connection pool names to pool IDs. |
| `connection_pool_host` | Map of connection pool names to pool hostnames. |
| `connection_pool_private_host` | Map of connection pool names to private pool hostnames. |
| `connection_pool_port` | Map of connection pool names to pool ports. |
| `connection_pool_uri` | Map of connection pool names to pool URIs. *(sensitive)* |
| `connection_pool_private_uri` | Map of connection pool names to private pool URIs. *(sensitive)* |
| `connection_pool_password` | Map of connection pool names to pool passwords. *(sensitive)* |
| `db_name` | List of names of the created databases in the cluster. |
| `user_role` | Map of usernames to their roles in the cluster. |
| `user_password` | Map of usernames to their passwords. *(sensitive)* |
| `database_firewall_id` | The unique identifier of the database firewall. |
| `database_firewall_rule` | List of firewall rules with uuid, type, value, and created_at. |
| `database_replica_firewall_rule` | List of replica firewall rules with uuid, type, value, and created_at. |
| `replica_id` | The ID of the database replica. |
| `replica_host_name` | The hostname of the database replica. |
| `replica_cluster_private_host` | The private hostname of the replica (accessible only within the same account and region). |
| `replica_cluster_port` | Network port the database replica is listening on. |
| `replica_cluster_uri` | The full URI for connecting to the database replica. *(sensitive)* |
| `replica_cluster_default_database` | Name of the replica's default database. |
| `replica_cluster_default_user` | Username for the replica cluster's default user. |
| `replica_cluster_default_password` | Password for the replica cluster's default user. *(sensitive)* |
