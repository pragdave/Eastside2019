# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :mm, MmWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fW0X9X7oRrZFJOwjXUwv2KrV3nqehAdnCF2eydrndkAjqOiqnYE8di76aQ5A1FDC",
  render_errors: [
    view: MmWeb.ErrorView,
    accepts: ~w(html json)
  ],
  pubsub: [
    name: Mm.PubSub,
    adapter: Phoenix.PubSub.PG2
  ],
  live_view: [
    signing_salt: "NaCl"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix,
  template_engines: [leex: Phoenix.LiveView.Engine]


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
