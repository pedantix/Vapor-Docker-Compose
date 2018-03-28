import FluentPostgreSQL
import Vapor

/// Called before your application initializes.
///
/// https://docs.vapor.codes/3.0/getting-started/structure/#configureswift
public func configure(
    _ config: inout Config,
    _ env: inout Environment,
    _ services: inout Services
) throws {
    /// Register providers first
    try services.register(FluentPostgreSQLProvider())

    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    /// Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    /// middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
    middlewares.use(DateMiddleware.self) // Adds `Date` header to responses
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)

    // Configure a database
    let databaseConfig: PostgreSQLDatabaseConfig
    if let hostname = ProcessInfo.processInfo.environment["DATABASE_HOSTNAME"],
        let username = ProcessInfo.processInfo.environment["DATABASE_USERNAME"] {
        databaseConfig = PostgreSQLDatabaseConfig(hostname: hostname,
                                 username: username)
    } else {
        databaseConfig = PostgreSQLDatabaseConfig.default()
    }

    let database = PostgreSQLDatabase(config: databaseConfig)

    /// Register the configured SQLite database to the database config.
    var databases = DatabaseConfig()
    databases.add(database: database, as: .psql)
    services.register(databases)

    /// Configure migrations
    var migrations = MigrationConfig()
    migrations.add(model: Todo.self, database: .psql)
    services.register(migrations)

}
