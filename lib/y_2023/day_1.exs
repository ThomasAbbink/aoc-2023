ExUnit.start()

defmodule Day_1 do
  def load_input do
    File.read!(~c"./input/day_1.txt")
  end

  def parse(file) do
    file |> String.split("\n", trim: true)
  end

  def part_one(input) do
    input
    |> Enum.map(fn string ->
      string
      |> String.split("")
      |> Enum.map(fn chars ->
        v = Integer.parse(chars)

        case v do
          :error -> nil
          {int, _rem} -> int
        end
      end)
      |> Enum.reject(&is_nil/1)
    end)
    |> Enum.map(&:erlang.binary_to_integer("#{List.first(&1)}#{List.last(&1)}"))
    |> Enum.sum()
  end

  def part_two(input) do
    input
    |> Enum.map(fn string ->
      string
      |> String.replace("one", "one1one")
      |> String.replace("two", "two2two")
      |> String.replace("three", "three3three")
      |> String.replace("four", "four4four")
      |> String.replace("five", "five5five")
      |> String.replace("six", "six6six")
      |> String.replace("seven", "seven7seven")
      |> String.replace("eight", "eight8eight")
      |> String.replace("nine", "nine9nine")
      |> String.split("")
      |> Enum.map(fn chars ->
        v = Integer.parse(chars)

        case v do
          :error -> nil
          {int, _rem} -> int
        end
      end)
      |> Enum.reject(&is_nil/1)
    end)
    |> Enum.map(&:erlang.binary_to_integer("#{List.first(&1)}#{List.last(&1)}"))
    # |> IO.inspect()
    |> Enum.sum()
  end

  def main do
    input = load_input() |> parse()
    input |> part_one() |> IO.puts()
    input |> part_two() |> IO.puts()
  end

  use ExUnit.Case

  test "test part one" do
    result = File.read!("./input/day_1_test.txt") |> Day_1.parse() |> Day_1.part_one()
    assert result == 142
  end

  test "test part two" do
    result = File.read!("./input/day_1.2_test.txt") |> Day_1.parse() |> Day_1.part_two()
    assert result == 281
  end
end

Day_1.main()
