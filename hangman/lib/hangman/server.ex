defmodule Hangman.Server do
  use GenServer

  alias Hangman.Game

  def start_link() do
    IO.puts("Started new game")
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    {:ok, Game.new_game()}
  end

  def handle_call({:make_move, guess}, _from, game) do
    {game, tally} = Game.make_move(game, guess)
    {:reply, tally, game}
  end

  def handle_call({:tally}, _from, game) do
    {:reply, Game.tally(game), game}
  end
end
