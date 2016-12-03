defmodule WordCount.Greedy do
  @moduledoc """
  This module is gready. It loads all the data into the memory
  on each step. So it will not work of large files.

  See `WordCount.Lazy` on how to deal with large or even infinite files.
  """

  def count(source_file) do
    File.read!(source_file)
    |> String.split("\n")
    |> Enum.flat_map(&String.split/1)
    |> Enum.reduce(%{}, fn(word, map) ->
      Map.update(map, word, 1, &(&1 + 1))
    end)
  end
end
