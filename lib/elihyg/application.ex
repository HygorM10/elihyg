defmodule Elihyg.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Elihyg.Repo,
      # Start the Telemetry supervisor
      ElihygWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Elihyg.PubSub},
      # Start the Endpoint (http/https)
      ElihygWeb.Endpoint
      # Start a worker by calling: Elihyg.Worker.start_link(arg)
      # {Elihyg.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Elihyg.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElihygWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
