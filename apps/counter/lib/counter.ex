defmodule Counter do
  @moduledoc """
  Takes current state (an integer) and returns the new state (an integer).

  Examples:

      iex> Counter.increment 1
      2

      iex> Counter.decrement 1
      0

      iex> Counter.increment_if_odd 2
      2

      iex> Counter.increment_if_odd 1
      2
  """

  @spec increment(integer) :: integer
  def increment(num), do: num + 1

  @spec decrement(integer) :: integer
  def decrement(num), do: num - 1

  @spec increment_if_odd(integer) :: integer
  def increment_if_odd(num) when rem(num, 2) == 1, do: num + 1
  def increment_if_odd(num), do: num
end
