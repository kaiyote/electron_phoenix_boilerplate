# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :electron_phoenix_boilerplate, ElectronPhoenixBoilerplate.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "J4eI2nYkIq9yb1Mf4CBmQSv1NBP8z0I9jruIhDuU68quPZqZjJ2K8A3e9r+5CE0v",
  render_errors: [view: ElectronPhoenixBoilerplate.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElectronPhoenixBoilerplate.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
