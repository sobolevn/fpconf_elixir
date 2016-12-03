alias WordCount.{Greedy, Lazy, Flow}

source = "files/small.txt"

matrix = %{
  "greedy" => fn -> Greedy.count(source) end,
  "lazy" => fn -> Lazy.count(source) end,
  "flow" => fn -> Flow.count(source) end
}

Benchmark.measure("small", matrix)
