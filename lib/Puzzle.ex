defmodule Puzzle do
  def get_input(options) do
    [year, day] = Keyword.take(options, [:year, :day])
    # IO.puts("getting input for year: #{year}, day: #{day}")
  end

  def solve(options \\ []) do
    input = get_input(options)

    parts =
      options
      |> Keyword.take([:part_one, :part_two])

    IO.inspect(parts)
  end
end
