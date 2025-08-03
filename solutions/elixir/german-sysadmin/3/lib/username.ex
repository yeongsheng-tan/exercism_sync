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
      ?_ -> sanitize(tail, acc ++ [head])
      ?ß -> sanitize(tail, acc ++ 'ss')
      ?ä -> sanitize(tail, acc ++ 'ae')
      ?ö -> sanitize(tail, acc ++ 'oe')
      ?ü -> sanitize(tail, acc ++ 'ue')
      head when head >= ?a and head <= ?z -> sanitize(tail, acc ++ [head])
      _ -> sanitize(tail, acc)
    end
  end

  defp sanitize([], acc) do
    acc
  end
end
