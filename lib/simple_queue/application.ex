defmodule SimpleQueue.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: SimpleQueue.Worker.start_link(arg)
      # {SimpleQueue.Worker, arg}
      {SimpleQueue.CounterSup, [10000, 20000]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SimpleQueue.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

# new_child_spec = Supervisor.child_spec({SimpleQueue.Counter, 30000}, id: 30000)
# Supervisor.start_child(OurNewApp.CounterSup, new_child_spec)
# Supervisor.which_children(SimpleQueue.CounterSup)
