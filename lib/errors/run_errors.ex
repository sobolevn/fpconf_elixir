defmodule StackSupervisor do
  def run do
    # Import helpers for defining supervisors
    import Supervisor.Spec

    # Supervise the Stack server which will be started with
    # a single argument [:hello] and the default registered
    # name of MyStack.
    children = [
      worker(Stack, [[:hello], [name: MyStack]])
    ]

    # Start the supervisor with our child
    {:ok, _pid} = Supervisor.start_link(children, strategy: :one_for_one)
  end
end

## Now run in your shell:
## `iex -S mix`

## And then line by line:

# StackSupervisor.run
# GenServer.call(MyStack, :pop)

# GenServer.cast(MyStack, {:push, :world})

# GenServer.call(MyStack, :pop)
# GenServer.call(MyStack, :pop)  # this will fail

## Now the app will be restarted with the default state:
# GenServer.call(MyStack, :pop)
