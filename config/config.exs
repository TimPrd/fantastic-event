# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :happyevent,
  ecto_repos: [Happyevent.Repo]

# Configures the endpoint
config :happyevent, HappyeventWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FjqXn1fIQloX1fah5jJV9OMenLwWPXtDrmNmLDim2x1cfKfIQoh+ORt0YHpqjMqt",
  render_errors: [view: HappyeventWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Happyevent.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "KK4ly8HdzOmhsB+2itWau5xYDIPW8ctk"
  ]
# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason



# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
