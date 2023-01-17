defmodule Wh40ktoe.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Wh40ktoe.Repo,
      # Start the Telemetry supervisor
      Wh40ktoeWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Wh40ktoe.PubSub},
      # Start the Endpoint (http/https)
      Wh40ktoeWeb.Endpoint
      # Start a worker by calling: Wh40ktoe.Worker.start_link(arg)
      # {Wh40ktoe.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Wh40ktoe.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Wh40ktoeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
