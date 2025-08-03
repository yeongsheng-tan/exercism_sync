defmodule BirdCount do
  def today(_list = []) do
    nil
  end

  def today(list) do
    [today | _rest] = list
    today
  end

  def increment_day_count(_list = []) do
    [1]
  end

  def increment_day_count(list) do
    [today | rest] = list
    [today + 1 | rest]
  end

  def has_day_without_birds?(_list = []) do
    false
  end

  def has_day_without_birds?(list) do
    [head | tail] = list

    cond do
      today([head]) in [0, nil] -> true
      true -> has_day_without_birds?(tail)
    end
  end

  def total(list) do
    Enum.reduce(list, 0, fn count, acc -> count + acc end)
  end

  def busy_days(list) do
    Enum.filter(list, fn count -> count >= 5 end)
    |> Enum.count()
  end
end
