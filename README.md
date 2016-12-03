# fpconf-elixir

## Prerequirements

You will need:

1. `elixir -> 1.3`
2. `erlang -> 0.19` 

## Errors handling

See [lib/errors](https://github.com/sobolevn/fpconf_elixir/tree/master/lib/errors) directory
 for the full code. 


## Benchmarks

To run the benchmarks you will need:

1. `mix deps.get`
2. `mix run samples/wordcount_$SIZE.exs` (available sizes are: `small`, `medium` and `large`)

Every benchmark generates charts in the `samples_output/` directory.

### Inputs

> large.txt   18M  
> medium.txt   886K  
> small.txt    31B

### Benchmarking results

- Large

| Name | ips  | average | deviation | median |
|------|------|---------|-----------|--------|
|flow  |0.25  |3.94 s   |±0.55%     |3.94 s  |
|lazy  |0.22  |4.52 s   |±0.79%     |4.52 s  |
|greedy|0.0910|10.99 s  |±0.00%     |10.99 s |

> Comparison:  
> flow            0.25  
> lazy            0.22 - 1.15x slower  
> greedy        0.0910 - 2.79x slower

- Medium

| Name | ips  | average | deviation | median  |
|------|------|---------|-----------|---------|
|flow  |4.86  |205.64 ms|±4.99%     |202.80 ms|
|lazy  |4.43  |225.63 ms|±2.57%     |227.08 ms|
|greedy|2.83  |352.88 ms|±1.01%     |352.62 ms|

> Comparison:  
> flow            4.86  
> lazy            4.43 - 1.10x slower  
> greedy          2.83 - 1.72x slower

- Small

| Name | ips   | average | deviation | median  |
|------|-------|---------|-----------|---------|
|greedy|1.23 K |40.92 μs |±108.34%   |34.00 μs |
|lazy  |10.26 K|97.49 μs |±54.48%    |90.00 μs |
|flow  |24.44 K|810.41 μs|±30.30%    |803.00 μs|

> Comparison:  
> greedy       24.44 K  
> lazy         10.26 K - 2.38x slower  
> flow          1.23 K - 19.81x slower
