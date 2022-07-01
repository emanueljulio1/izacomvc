# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :izacomvc,
  ecto_repos: [Izacomvc.Repo]

config :izacomvc, Izacomvc.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :izacomvc, IzacomvcWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Wl4bXCT3pMWrHvWyX/+aOM65eKNXsA+c6BUPPUuY7SrTMNgktDFinfj++qzxr1Lg",
  render_errors: [view: IzacomvcWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Izacomvc.PubSub,
  live_view: [signing_salt: "CZIUgl4Q"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
