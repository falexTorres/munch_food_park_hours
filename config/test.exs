use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :sign_me_in, SignMeIn.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :sign_me_in, SignMeIn.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "yllaf",
  password: "asdf;lkj1",
  database: "sign_me_in_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
