defmodule Username do
  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss
    sanitize(username, '')
  end

  defp sanitize([head | tail], acc) do
    case head do
      95 -> sanitize(tail, acc ++ [head])
      223 -> sanitize(tail, acc ++ 'ss')
      228 -> sanitize(tail, acc ++ 'ae')
      246 -> sanitize(tail, acc ++ 'oe')
      252 -> sanitize(tail, acc ++ 'ue')
      head when head > 96 and head < 123 -> sanitize(tail, acc ++ [head])
      _ -> sanitize(tail, acc)
    end
  end

  defp sanitize([], acc) do
    acc
  end
end
