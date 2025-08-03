defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    case valid_nucleotide?(nucleotide) do
      true -> histogram(strand) |> Map.get(nucleotide)
      _ -> raise ArgumentError
    end
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    case valid_strand?(strand) do
      true ->
        Enum.group_by(strand, &(&1)) |> Enum.reduce(%{?A => 0, ?C => 0, ?G => 0, ?T => 0}, fn {x, y}, acc -> Map.put(acc, x, Enum.count(y)) end)
      _ -> raise ArgumentError
    end
  end

  def valid_strand?(strand) do
    Enum.all?(strand, &(&1 == ?A || &1 == ?C || &1 == ?G || &1 == ?T))
  end

  def valid_nucleotide?(nucleotide) do
    (nucleotide == ?A) || (nucleotide == ?C) || (nucleotide == ?G) || (nucleotide == ?T)
  end
end