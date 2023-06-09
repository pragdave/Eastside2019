defmodule Mastermind do

  @moduledoc """
  We represent a game of Mastermind as it is played by our client.

  The client first calls `new_game`, which returns an opaque identifier for the
  game in play.

  The client then calls `make_guess` to submit a guess and have it scored, and
  `status` to return an external view of the game status. This status contains
  the board geometry along with a full history of guesses and their scores.

  ### Internal Representation

  Colors are represented as positive integers, `1..@colors`.

  A guess is a list of color numbers. The length of this list must be the same
  as the width of the board (`@width`).

  The target pattern, like each guess, is simply a list of colors. It is
  normally generated randomly by `new_game`, but can be passed in as an option.
  This feature is used by the tests.

  ### External Representation

  See type `external_state`
  """

  alias Mastermind.State

  @doc """
  `Mastermind.state/1` returns the following map

   * `colors:` _n_

     The number of colors available in this game

   * `width:` _n_

     The width of the board (that is, the number of values to guess)

   * `turns_left:` _n_

     The number of turns remaining.

   * `moves:` _[ move, move, ... ]_

     A list of moves, where each move is a map containing two items, `guess:`
     and `score:`. The guess field is the guess made for that more, and the
     score is a map with two keys, `reds:` and `whites:`, which give the counts
     of red and white pegs for that guess.

  """

  @width  4
  @colors 6
  @max_turns 10

  def new_game(target \\ nil) do
    %State{
      width:      @width,
      colors:     @colors,
      turns_left: @max_turns,
      target:     target || generate_target()
    }
  end

  def make_guess(game, guess) when is_list(guess) do
    score = score_guess(game.target, guess)
    move = %State.Move{ guess: guess, score: score }

    %State{ game |
      turns_left: game.turns_left - 1,
      moves: [ move | game.moves ],
      won:   score.reds == game.width,
    }
  end

  defp score_guess(target, guess) do
    reds = count_exact_matches(target, guess)
    whites = count_any_matches(target, guess) - reds

    %{ reds: reds, whites: whites }
  end

  defp count_exact_matches(target, guess) do
    Enum.zip(target, guess)
    |> Enum.count(fn {t, g} -> t == g end)
  end

  defp count_any_matches(target, guess) do
    length(target) - length(target -- guess)
  end

  defp generate_target() do
    possibles = 1..@colors

    1..@width
    |> Enum.map(fn _ -> Enum.random(possibles) end)
  end
end
