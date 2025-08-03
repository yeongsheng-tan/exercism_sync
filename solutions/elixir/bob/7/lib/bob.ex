defmodule Bob do
  def hey(input) do
    trimmed_input = String.strip(input)

    cond do
      shouting?(trimmed_input) and asking?(trimmed_input) -> "Calm down, I know what I'm doing!"
      asking?(trimmed_input) -> "Sure."
      silence?(trimmed_input) -> "Fine. Be that way!"
      shouting?(trimmed_input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp silence?(""), do: true
  defp silence?(_str), do: false

  defp shouting?(str) do
    String.upcase(str) == str and String.upcase(str) != String.downcase(str)
  end

  defp asking?(str) do
    String.ends_with?(str, "?")
  end
end
