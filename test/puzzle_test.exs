defmodule Tests do
  use ExUnit.Case

  for {day, index} <- Enum.with_index(Days.runnable()) do
    @day_number index + 1
    @day day

    test "test day #{@day_number} part one" do
      result =
        File.read!("test/input/day_#{@day_number}/part_one.txt")
        |> @day.parse()
        |> @day.part_one()

      assert result == @day.config.test_result_part_one
    end

    test "test #{@day_number} part two" do
      result =
        File.read!("test/input/day_#{@day_number}/part_two.txt")
        |> @day.parse()
        |> @day.part_two()

      assert result == @day.config.test_result_part_two
    end
  end
end
