defmodule BirdCount do
  def today(list = []) do
    nil
  end

  def today(list) do
    [today | _rest] = list
    today
  end

  def increment_day_count(list = []) do
    [1]
  end

  def increment_day_count(list) do
    [today | rest] = list
    [today + 1 | rest]
  end

  def has_day_without_birds?(list) do
    Enum.member?(list, 0)
  end

  def total(list) do
    Enum.reduce(list, 0, fn count, acc -> count + acc end)
  end

  def busy_days(list) do
    Enum.filter(list, fn count -> count >= 5 end)
    |> Enum.count()
  end
end
