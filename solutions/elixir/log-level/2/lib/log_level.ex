defmodule LogLevel do
  def to_label(level, legacy?) do
    log_label_map = %{
      0 => :trace,
      1 => :debug,
      2 => :info,
      3 => :warning,
      4 => :error,
      5 => :fatal
    }

    cond do
      not legacy? && log_label_map[level] == nil -> :unknown
      legacy? && level == 0 -> :unknown
      legacy? && level == 5 -> :unknown
      legacy? && log_label_map[level] == nil -> :unknown
      true -> log_label_map[level]
    end
  end

  def alert_recipient(level, legacy?) do
    receipient_map = %{
      :error => :ops,
      :fatal => :ops,
      :unknown => :dev2
    }

    cond do
      not legacy? && to_label(level, legacy?) == nil -> false
      legacy? && to_label(level, legacy?) == :unknown -> :dev1
      legacy? && to_label(level, legacy?) == nil -> false
      true -> receipient_map[to_label(level, legacy?)]
    end
  end
end
