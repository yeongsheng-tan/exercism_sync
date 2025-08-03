defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> normalize
    |> find_words
    |> count_words
  end

  defp normalize(sentence) do
    String.downcase(sentence)
  end

  defp find_words(sentence) do
    List.flatten(Regex.scan(~r/[\p{L}\p{N}\-]+/u , sentence))
  end

  defp count_words(words) do
    Enum.reduce(words, %{}, fn(w, word_map) -> Map.update(word_map, w, 1, &(&1 + 1)) end)
  end
end
