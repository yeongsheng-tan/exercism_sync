defmodule SecretHandshake do
  use Bitwise

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    actions_reduce(code, [])
  end

  def actions_reduce(_code = 0, actions), do: actions

  def actions_reduce(code, actions) when (code &&& 1) === 1,
    do: actions_reduce(code - 1, actions ++ List.wrap("wink"))

  def actions_reduce(code, actions) when (code &&& 2) === 2,
    do: actions_reduce(code - 2, actions ++ List.wrap("double blink"))

  def actions_reduce(code, actions) when (code &&& 4) === 4,
    do: actions_reduce(code - 4, actions ++ List.wrap("close your eyes"))

  def actions_reduce(code, actions) when (code &&& 8) === 8,
    do: actions_reduce(code - 8, actions ++ List.wrap("jump"))

  def actions_reduce(code, actions) when code >= 16,
    do: actions_reduce(code - 16, Enum.reverse(actions))
end
