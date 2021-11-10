import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :electron_phoenix_web, ElectronPhoenixWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "zva9ScsbohgPhRe5s/SMRCy8HyOyMREI1ddRxWaH80ZxqQGYvGY4nocdMmX8S77H",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# In test we don't send emails.
config :electron_phoenix, ElectronPhoenix.Mailer, adapter: Swoosh.Adapters.Test

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
