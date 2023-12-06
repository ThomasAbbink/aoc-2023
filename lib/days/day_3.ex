defmodule Day_3 do
  @config %TestConfig{test_result_part_one: 4361, test_result_part_two: 467_835}

  def config do
    @config
  end

  @spec parse(binary()) :: [binary()]
  def parse(file) do
    file
    |> String.split("\n", trim: true)
  end

  def to_table(input) do
    input
    |> Enum.with_index()
    |> Enum.map(fn {line, y} ->
      line
      |> String.split("", trim: true)
      |> Enum.with_index()
      |> Enum.map(&%{value: elem(&1, 0), x: elem(&1, 1), y: y})
    end)
  end

  def parse_numbers(input) do
    input
    |> Enum.with_index()
    |> Enum.map(fn {line, line_index} ->
      Regex.scan(~r/\d+/, line, return: :index)
      |> List.flatten()
      |> Enum.map(fn {start, length} ->
        %{value: String.slice(line, start, length), y: line_index, x: start, length: length}
      end)
    end)
    |> List.flatten()
  end

  def parse_symbol_adjacent_cells(input) do
    to_table(input)
    |> Enum.flat_map(fn line ->
      line
      |> Enum.reject(fn cell ->
        cell.value |> String.match?(~r/(\.|\d)/)
      end)
      |> Enum.flat_map(fn cell ->
        for i <- -1..1, j <- -1..1 do
          %{value: cell.value, x: cell.x + i, y: cell.y + j}
        end
      end)
    end)
  end

  def part_one(input) do
    symbol_adjacent_cells = parse_symbol_adjacent_cells(input)
    numbers = parse_numbers(input)

    numbers |> Enum.map(&String.to_integer(&1.value)) |> Enum.sum()
    # for each number check if they occupy a symbol adjacent cell
    filtered =
      numbers
      |> Enum.filter(fn number ->
        0..(number.length - 1)
        |> Enum.any?(fn x ->
          Enum.any?(symbol_adjacent_cells, fn cell ->
            cell.x === number.x + x && cell.y === number.y
          end)
        end)
      end)

    filtered
    |> Enum.map(&String.to_integer(&1.value))
    |> Enum.sum()
  end

  def part_two(input) do
    gears = to_table(input) |> List.flatten() |> Enum.filter(fn cell -> cell.value === "*" end)
    numbers = parse_numbers(input)

    gears
    |> Enum.map(fn cell ->
      adjacent_numbers =
        numbers
        |> Enum.filter(fn number ->
          overlaps =
            for x <- number.x..(number.x + number.length - 1) do
              abs(x - cell.x) <= 1 && abs(number.y - cell.y) <= 1
            end

          Enum.any?(overlaps)
        end)

      case length(adjacent_numbers) do
        2 ->
          String.to_integer(List.first(adjacent_numbers).value) *
            String.to_integer(List.last(adjacent_numbers).value)

        _ ->
          0
      end
    end)
    |> Enum.sum()
  end
end
