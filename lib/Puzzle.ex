defprotocol Puzzle do
  def parse(file)
  def part_one(input)
  def part_two(input)
end

defimpl Puzzle, for: Any do
  @fallback_to_any true
  def parse(file) do
    file
  end

  @fallback_to_any true
  def part_one(_input) do
    0
  end

  @fallback_to_any true
  def part_two(_input) do
    0
  end
end
