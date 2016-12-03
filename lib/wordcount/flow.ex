defmodule WordCount.Flow do
  @moduledoc """
  This module is concurent. It will spawn a lot of processes to
  complete the given task.

  Elixir power!
  """

  alias Experimental.Flow  # GenStage is still not merged in 1.4-rc0

  def count(source_file) do
    File.stream!(source_file, [], :line)
    |> Flow.from_enumerable()
    |> Flow.flat_map(&String.split/1)
    |> Flow.partition()  # here's where the magic happens
    |> Flow.reduce(fn -> %{} end, fn(word, map) ->
      Map.update(map, word, 1, &(&1 + 1))
    end)
    |> Enum.into(%{})
  end
end
