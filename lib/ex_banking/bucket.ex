defmodule ExBanking.Bucket do
  @moduledoc """
  Agent module, in memory storage
  to keep the currency and balance
  for a specific user
  """
  use Agent, restart: :temporary

  @doc """
  Starts a new bucket
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Gets a value from bucket by key
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Puts the value for the given key in the bucket
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end
end
