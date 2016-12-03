defmodule WordCount.Lazy do
  @moduledoc """
  This module uses `Streams` which are lazy.
  They won't load anything into memory until they actually need it.
  """

  def count(source_file) do
    File.stream!(source_file, [], :line)
    |> Stream.flat_map(&String.split/1)
    |> Enum.reduce(%{}, fn(word, map) ->
      Map.update(map, word, 1, &(&1 + 1))
    end)
  end
end
