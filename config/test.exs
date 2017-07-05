use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :munch_hours, MunchHours.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :munch_hours, MunchHours.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "yllaf",
  password: "asdf;lkj1",
  database: "munch_hours_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
