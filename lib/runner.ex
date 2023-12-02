defmodule Runner do
  def run do
    for {day, index} <- Enum.with_index(Days.runnable()) do
      run_module(day, index)
    end
  end

  defp run_module(day, index) do
    input = load_input(index) |> day.parse()
    input |> day.part_one() |> IO.puts()
    input |> day.part_two() |> IO.puts()
  end

  defp load_input(index) do
    File.read!("lib/input/day_#{index + 1}.txt")
  end
end
