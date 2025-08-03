defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    split_words(string) |> concat_first_char
  end

  def split_words(string) do
    String.split(string, ~r{\s|(?=[A-Z][^A-Z])}, trim: true)
  end

  def concat_first_char(words) do
    Enum.map_join(words, &(String.capitalize(String.first(&1))))
  end
end