defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @dna_to_rna_map %{ 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U' }

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.reduce(dna, [], fn(nucleotide, acc) -> acc ++ Map.get(@dna_to_rna_map, [nucleotide]) end)
  end

end
