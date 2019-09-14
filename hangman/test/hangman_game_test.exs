defmodule Hangman.GameTest do
  use ExUnit.Case

  alias Hangman.Game

  test "new_game returns structure" do
    game = Game.new_game()
    assert game.turns_left == 7 
    assert game.game_state == :initializing
    assert game.letters > 0
    assert game.letters |> Enum.all?(&(?a <= &1 and &1 >= ?z))
  end

  test "state isn't changed for :won or :lost game" do
    for state <- [:won, :lost] do
      game = Game.new_game()
             |> Map.put(:game_state, :won)
      assert { ^game, _ } = Game.make_move(game, "x")
    end
  end
end

