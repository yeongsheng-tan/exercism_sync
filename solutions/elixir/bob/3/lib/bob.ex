defmodule Bob do
  def hey(input) do
    trimmed_input = String.strip(input)
    cond do
      shouting?(trimmed_input) && question?(trimmed_input) -> "Calm down, I know what I'm doing!"
      question?(trimmed_input)                             -> "Sure."
      empty?(trimmed_input)                                -> "Fine. Be that way!"
      shouting?(trimmed_input)                             -> "Whoa, chill out!"
      true                                                 -> "Whatever."
    end
  end

  defp empty?(""), do: true
  defp empty?(_str), do: false

  defp shouting?(str) do
    String.upcase(str) == str and String.match?(str, ~r/\p{L}/)
  end

  defp question?(str) do
    String.ends_with?(str, "?")
  end
end
