defmodule HighScore do
  @default_score %{}
  @initial_score 0

  def new() do
    @default_score
  end

  def add_player(scores, name, score \\ @initial_score) do
    Map.merge(scores, %{name => score})
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    {_curr_val, score_map} = Map.get_and_update(scores, name, &{&1, @initial_score})

    score_map
  end

  def update_score(scores, name, score) do
    Map.update(scores, name, score, &(&1 + score))
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
