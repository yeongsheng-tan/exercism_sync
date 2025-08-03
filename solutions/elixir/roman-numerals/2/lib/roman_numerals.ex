defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @numerals %{1    => "I",
              5    => "V",
              10   => "X",
              50   => "L",
              100  => "C",
              500  => "D",
              1000 => "M"}

  @spec numeral(number) :: String.t()
  def numeral(number) do
    Integer.digits(number)
    |> Enum.reverse
    |> Stream.with_index
    |> Enum.map(&numeral_for_digits/1)
    |> Enum.reverse
    |> Enum.join
  end

  defp numeral_for_digits(digit_with_index) do
    {digit, index} = digit_with_index
    magnitude = magnitude_at_index(index)

    arabic_to_roman_template(digit, @numerals[1 * magnitude],
                                    @numerals[5 * magnitude],
                                    @numerals[10 * magnitude])
  end

  defp magnitude_at_index(decimal_place) do
    :math.pow(10, decimal_place)
    |> round
  end

  defp arabic_to_roman_template(digit, roman_one, roman_five, roman_ten) do
    cond do
      digit <= 3               -> String.duplicate(roman_one, digit)
      digit == 4               -> roman_one <> roman_five
      digit >= 5 && digit <= 8 -> roman_five <> String.duplicate(roman_one, digit - 5)
      digit == 9               -> roman_one <> roman_ten
    end
  end
end
