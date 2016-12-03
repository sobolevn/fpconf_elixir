alias WordCount.{Greedy, Lazy, Flow}

source = "files/large.txt"

unless File.exists?(source) do
  # The large file is excluded from the version controll,
  # so we will recreate it on the first run.
  IO.puts "Writing the `files/large.txt` ..."

  content = File.read!("files/medium.txt")

  for _ <- 0..20 do
    File.write!(source, content, [:append])
  end

  %{size: size} = File.stat! source
  IO.puts "Done, the final size is: #{size}"
end

matrix = %{
  "greedy" => fn -> Greedy.count(source) end,
  "lazy" => fn -> Lazy.count(source) end,
  "flow" => fn -> Flow.count(source) end
}

Benchmark.measure("large", matrix)
