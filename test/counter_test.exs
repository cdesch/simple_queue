defmodule SimpleQueueTest.CounterTest do
  use ExUnit.Case, async: true


  test "Check to see if counter running" do
    children = Supervisor.which_children(SimpleQueue.CounterSup)
    pids = Enum.map(children, fn(x) -> elem(x, 1) end)
    Enum.each(pids, fn(x) -> assert SimpleQueue.Counter.get(x) > 500 end)
  end
end
