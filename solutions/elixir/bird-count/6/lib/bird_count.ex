defmodule BirdCount do
  def today([]) do
    nil
  end

  def today([head | _tail]) do
    head
  end

  def increment_day_count([]) do
    [1]
  end

  def increment_day_count([head | tail]) do
    [head + 1 | tail]
  end

  def has_day_without_birds?([]) do
    false
  end

  def has_day_without_birds?([head | tail]) do
    cond do
      today([head]) in [0, nil] -> true
      true -> has_day_without_birds?(tail)
    end
  end

  def total(list) do
    total(list, 0)
  end

  defp total([head | tail], acc) do
    total(tail, head + acc)
  end

  defp total([], acc) do
    acc
  end

  def busy_days(list) do
    busy_days(list, 0)
  end

  defp busy_days([], acc) do
    acc
  end

  defp busy_days([head | tail], acc) do
    cond do
      head >= 5 -> busy_days(tail, 1 + acc)
      true -> busy_days(tail, acc)
    end
  end
end
