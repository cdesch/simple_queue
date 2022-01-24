defmodule SimpleQueue.Listless do
  # Reference https://samuelmullen.com/articles/elixir-processes-testing/
  use GenServer

  def start_link(arg, opts \\ []) do
    name = Keyword.get(opts, :name, __MODULE__)
    GenServer.start_link(__MODULE__, arg, name: name)
  end

  def init(state) do
    {:ok, state}
  end

  def list(name \\ __MODULE__) do
    GenServer.call(name, :list)
  end

  def handle_call(:list, _from, state) do
    {:reply, state, state}
  end
end
