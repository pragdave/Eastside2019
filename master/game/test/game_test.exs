defmodule GameTest do
  use ExUnit.Case
  doctest Game

  test "results of generate are in range" do
    result = Game.generate(10)
    for value <- result do
      assert value >= 1
      assert value <= 6
    end
  end
end
