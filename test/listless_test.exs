defmodule SimpleQueueTest.ListlessTest do
  use ExUnit.Case, async: true

  test "Listless.list/0" do
    child_spec = %{
      id: Unlisted,
      start: {SimpleQueue.Listless, :start_link, [[], [name: Unlisted]]}
    }

    pid = start_supervised!(child_spec)

    assert SimpleQueue.Listless.list(Unlisted) == []

    # -- or -- #

    assert SimpleQueue.Listless.list(pid) == []
  end
end
