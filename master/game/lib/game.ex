defmodule Game do

  defmodule Game.State do
    defstruct(
      target:     [],
      turns_left: 9,
      moves:      [],
      colors:     6,
      columns:    4
    )
  end

  @doc """
  Return a list of `length` integers between 1 and 6.

      iex> result = Game.generate(5)
      iex> length(result)
      5

  """
  def generate(length) do
    1..length |> Enum.map(fn _ -> :rand.uniform(6) end)
  end
end
