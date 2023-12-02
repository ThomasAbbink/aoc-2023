defmodule Day_2 do
  @config %Day{test_result_part_one: 8, test_result_part_two: 2286}
  def config do
    @config
  end

  def parse(file) do
    file
    |> String.split("\n", trim: true)
    |> Enum.with_index(1)
    |> Enum.map(fn {line, i} ->
      %{:game_id => i, :draws => parse_line(line)}
    end)
  end

  def parse_line(line) do
    line
    |> String.split(":", trim: true)
    |> List.last()
    |> String.split(";")
    |> Enum.with_index()
    |> Enum.flat_map(fn {string, index} ->
      string |> String.split(",") |> Enum.map(&String.trim(&1)) |> Enum.map(&{&1, index})
    end)
    |> Enum.map(fn grab ->
      {value, remainder} =
        case Integer.parse(elem(grab, 0)) do
          :error -> {0, ""}
          {value, remainder} -> {value, String.trim(remainder)}
        end

      {String.to_atom(remainder), value, elem(grab, 1)}
    end)
  end

  def value_impossible?({color, amount, _}) do
    case color do
      :red -> amount > 12
      :green -> amount > 13
      :blue -> amount > 14
    end
  end

  def part_one(input) do
    input
    |> Enum.filter(fn game ->
      game.draws |> Enum.find(&value_impossible?/1) == nil
    end)
    |> Enum.map(& &1.game_id)
    |> Enum.sum()
  end

  def part_two(input) do
    input
    |> Enum.map(& &1.draws)
    |> Enum.map(fn draw ->
      draw
      |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
    end)
    |> Enum.map(fn values ->
      IO.inspect(values)
      Enum.max(values[:green]) * Enum.max(values[:red]) * Enum.max(values[:blue])
    end)
    |> Enum.sum()
    |> dbg()
  end
end
