# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sign_me_in,
  ecto_repos: [SignMeIn.Repo]

# Configures the endpoint
config :sign_me_in, SignMeIn.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8skL2928fmkG0hhn0vTN+LIRonbqHXShZrbX/pSLpqOlj5XA5dyfcEsoNYfgxl7y",
  render_errors: [view: SignMeIn.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SignMeIn.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
