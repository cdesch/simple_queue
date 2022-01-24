defmodule SimpleQueueTest.RegistryTest do
  use ExUnit.Case, async: true

  setup do
    registry = start_supervised!(SimpleQueue.Registry)
    %{registry: registry}
  end

  test "spawns buckets", %{registry: registry} do
    assert SimpleQueue.Registry.lookup(registry, "shopping") == :error

    SimpleQueue.Registry.create(registry, "shopping")
    assert {:ok, bucket} = SimpleQueue.Registry.lookup(registry, "shopping")

    SimpleQueue.Bucket.put(bucket, "milk", 1)
    assert SimpleQueue.Bucket.get(bucket, "milk") == 1
  end
end
