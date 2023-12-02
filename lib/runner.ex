defmodule Runner do
  import IO.ANSI

  def run do
    for {day, index} <- Enum.with_index(Days.runnable(), 1) do
      run_module(day, index)
    end
  end

  defp run_module(day, index) do
    input = load_input(index) |> day.parse()
    input |> day.part_one() |> format(index, "one")
    input |> day.part_two() |> format(index, "two")
  end

  defp format(result, index, part) do
    IO.puts(reset() <> "day #{index} part #{part}:" <> blue() <> bright() <> " #{result}")
  end

  defp load_input(index) do
    File.read!("lib/input/day_#{index}.txt")
  end
end
