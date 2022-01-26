defmodule SimpleQueue do
  @moduledoc """
  Documentation for `SimpleQueue`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> SimpleQueue.hello()
      :world

  """
  def hello do
    :world
  end

  #SimpleQueue.get_counts()
  def get_counts() do
    children = Supervisor.which_children(SimpleQueue.CounterSup)
    pids = Enum.map(children, fn(x) -> elem(x, 1) end)
    Enum.each(pids, fn(x) -> IO.inspect(SimpleQueue.Counter.get(x)) end)
    IO.inspect pids
  end
end
