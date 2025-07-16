defmodule Kanboard.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      KanboardWeb.Telemetry,
      Kanboard.Repo,
      {DNSCluster, query: Application.get_env(:kanboard, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Kanboard.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Kanboard.Finch},
      # Start a worker by calling: Kanboard.Worker.start_link(arg)
      # {Kanboard.Worker, arg},
      # Start to serve requests, typically the last entry
      KanboardWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Kanboard.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KanboardWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
