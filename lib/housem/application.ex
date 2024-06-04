defmodule Housem.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      HousemWeb.Telemetry,
      Housem.Repo,
      {DNSCluster, query: Application.get_env(:housem, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Housem.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Housem.Finch},
      # Start a worker by calling: Housem.Worker.start_link(arg)
      # {Housem.Worker, arg},
      # Start to serve requests, typically the last entry
      HousemWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Housem.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HousemWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
