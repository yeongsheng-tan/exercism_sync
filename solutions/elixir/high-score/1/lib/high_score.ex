defmodule HighScore do
  @default_score %{}

  def new() do
    @default_score
  end

  def add_player(scores, name, score \\ 0) do
    Map.merge(scores, %{name => score})
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    {curr_val, score_map} =
      Map.get_and_update(scores, name, fn current_value -> {current_value, 0} end)

    score_map
  end

  def update_score(scores, name, score) do
    {curr_val, score_map} =
      Map.get_and_update(scores, name, fn current_value ->
        cond do
          current_value == nil -> {current_value, score}
          true -> {current_value, current_value + score}
        end
      end)

    score_map
  end

  def get_players(scores) do
    # Please implement the get_players/1 function
    Map.keys(scores)
  end
end
