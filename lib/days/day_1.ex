defmodule Day_1 do
  @config %TestConfig{test_result_part_one: "142", test_result_part_two: "281"}
  def config do
    @config
  end

  @spec parse(binary()) :: any()
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
    |> to_string()
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
    |> Enum.sum()
    |> to_string()
  end
end
