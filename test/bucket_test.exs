defmodule SimpleQueueTest.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = SimpleQueue.Bucket.start_link([])
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert SimpleQueue.Bucket.get(bucket, "milk") == nil

    SimpleQueue.Bucket.put(bucket, "milk", 3)
    assert SimpleQueue.Bucket.get(bucket, "milk") == 3
  end
end
