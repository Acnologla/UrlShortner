# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :url,
  ecto_repos: [Url.Repo]

# Configures the endpoint
config :url, UrlWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SXwDbs07C3lNL7ZhpBSpSf/HpIQvjJwCq0RVI7R7mwjUX4v5Pp10CDu8pMbQS0E3",
  render_errors: [view: UrlWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Url.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
