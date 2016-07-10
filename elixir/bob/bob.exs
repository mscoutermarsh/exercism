defmodule Bob do
  def hey(input) do
    cond do
      question?(input) -> "Sure."
      silence?(input) -> "Fine. Be that way!"
      shouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp question?(input) do
    String.match?(input, ~r/.\?$/)
  end

  defp silence?(input) do
    String.strip(input) == ""
  end

  defp shouting?(input) do
    contains_letters?(input) && String.upcase(input) == input
  end

  defp contains_letters?(input) do
    String.match?(input, ~r/\p{L}/)
  end
end
