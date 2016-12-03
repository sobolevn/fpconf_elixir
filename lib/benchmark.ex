defmodule Benchmark do
  @moduledoc """
  This module is used for running benchmarks and generating reports.
  """

  def measure(name, matrix, opts \\ []) do
    time = Keyword.get(opts, :time, 5)

    Benchee.run(
      matrix,
      time: time,
      formatters: [
        &Benchee.Formatters.HTML.output/1,
        &Benchee.Formatters.Console.output/1
      ],
      html: [file: "samples_output/#{name}.html"]
    )
  end
end
