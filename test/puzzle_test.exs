defmodule Tests do
  use ExUnit.Case

  for {day, index} <- Enum.with_index(Days.runnable()) do
    @index index
    @day day

    test "test part one" do
      result =
        File.read!("test/input/day_#{@index + 1}/part_one.txt")
        |> @day.parse()
        |> @day.part_one()

      assert result == @day.config.test_result_part_one
    end

    test "test part two" do
      result =
        File.read!("test/input/day_#{@index + 1}/part_two.txt") |> @day.parse() |> @day.part_two()

      assert result == @day.config.test_result_part_two
    end
  end
end
