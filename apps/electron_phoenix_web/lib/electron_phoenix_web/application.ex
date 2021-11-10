defmodule ElectronPhoenixWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ElectronPhoenixWeb.Telemetry,
      # Start the Endpoint (http/https)
      ElectronPhoenixWeb.Endpoint
      # Start a worker by calling: ElectronPhoenixWeb.Worker.start_link(arg)
      # {ElectronPhoenixWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElectronPhoenixWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElectronPhoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
