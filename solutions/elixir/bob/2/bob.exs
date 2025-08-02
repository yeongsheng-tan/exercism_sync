defmodule Teenager do
  def hey(input) do
    trimmed_input = String.strip(input)
    cond do
      is_question?(trimmed_input) -> "Sure."
      is_empty?(trimmed_input)    -> "Fine. Be that way!"
      is_shouting?(trimmed_input) -> "Whoa, chill out!"
      true                        -> "Whatever."
    end
  end

  defp is_empty?(""), do: true
  defp is_empty?(_str), do: false

  defp is_shouting?(str) do
    String.upcase(str) == str and String.match?(str, ~r/\p{L}/)
  end

  defp is_question?(str) do
    String.ends_with?(str, "?")
  end
end