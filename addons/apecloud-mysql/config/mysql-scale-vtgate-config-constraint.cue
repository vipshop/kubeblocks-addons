#VtGateParameter: {

	// Stop buffering completely if a failover takes longer than this duration. (default 20s)
	buffer_max_failover_duration: =~"[-+]?([0-9]*(\\.[0-9]*)?[a-z]+)+$"

	// Minimum time between the end of a failover and the start of the next one (tracked per shard). Faster consecutive failovers will not trigger buffering. (default 1m0s)
	buffer_min_time_between_failovers: =~"[-+]?([0-9]*(\\.[0-9]*)?[a-z]+)+$"

	// Maximum number of buffered requests in flight (across all ongoing failovers). (default 10000)
	buffer_size: int & >=1

	// Duration for how long a request should be buffered at most. (default 10s)
	buffer_window: =~"[-+]?([0-9]*(\\.[0-9]*)?[a-z]+)+$"

	// Enable buffering (stalling) of primary traffic during failovers. (default false)
	enable_buffer: bool

	// Enable or disable logs. (default true)
	enable_logs: bool

	// Enable or disable query log. (default true)
	enable_query_log: bool

	// At startup, the tabletGateway will wait up to this duration to get at least one tablet per keyspace/shard/tablet type. (default 30s)
	gateway_initial_tablet_timeout: =~"[-+]?([0-9]*(\\.[0-9]*)?[a-z]+)+$"

	// After a duration of this time, if the client doesn't see any activity, it pings the server to see if the transport is still alive. (default 10s)
	grpc_keepalive_time: =~"[-+]?([0-9]*(\\.[0-9]*)?[a-z]+)+$"

	// After having pinged for keepalive check, the client waits for a duration of Timeout and if no activity is seen even after that the connection is closed. (default 10s)
	grpc_keepalive_timeout: =~"[-+]?([0-9]*(\\.[0-9]*)?[a-z]+)+$"

	// The health check timeout period. (default 2s)
	healthcheck_timeout: =~"[-+]?([0-9]*(\\.[0-9]*)?[a-z]+)+$"

	// Read After Write Consistency Level. Valid values are: EVENTUAL, SESSION, INSTANCE, GLOBAL. (default EVENTUAL)
	read_after_write_consistency: string & "EVENTUAL" | "SESSION" | "INSTANCE" | "GLOBAL"

	// The default timeout for read after write. (default 30.0)
	read_after_write_timeout: number & >=0

	// Enable read write splitting. Valid values are: disable, random, least_global_qps, least_qps, least_rt, least_behind_primary. (default disable)
	read_write_splitting_policy: string & "disable" | "random" | "least_global_qps" | "least_qps" | "least_rt" | "least_behind_primary"

	// Read write splitting ratio. (default 100)
	read_write_splitting_ratio: int & (>=0 & <=100)

	// Topo server timeout. (default 1s)
	srv_topo_timeout: =~"[-+]?([0-9]*(\\.[0-9]*)?[a-z]+)+$"

	// Tablet refresh interval. (default 1m0s)
	tablet_refresh_interval: =~"[-+]?([0-9]*(\\.[0-9]*)?[a-z]+)+$"

	//Which auth server implementation to use. Options: none, static, mysqlbased. (default "none")
	mysql_auth_server_impl: string & "none" | "static" | "mysqlbased"

	//JSON File to read the users/passwords from, need set mysql_auth_server_impl to static.
	mysql_auth_server_static_file: string

	//Path to ssl key for mysql server plugin SSL
	mysql_server_ssl_key: string

	//Path to the ssl ca for mysql server plugin SSL
	mysql_server_ssl_ca: string

	//Path to the ssl cert for mysql server plugin SSL
	mysql_server_ssl_cert: string

	//Reject insecure connections but only if mysql_server_ssl_cert and mysql_server_ssl_key are provided.(default "false")
	mysql_server_require_secure_transport: bool

	// Set default strategy for DDL statements. Override with @@ddl_strategy session variable
	ddl_strategy: string & "direct" | "online" | "mysql"

	// Enable or disable the feature of showing information about the vttablet node which executing the SQL. (default false)
	enable_display_sql_execution_vttablets: bool

	// Enable or disable the feature of read write splitting for read only txn (default false)
	enable_read_write_split_for_read_only_txn: bool

	// Enable or disable the feature of interception for DML without where clause (default true)
	enable_interception_for_dml_without_where: bool
}

// SectionName is section name
[SectionName=_]: #VtGateParameter
