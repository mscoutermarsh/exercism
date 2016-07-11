defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    word_list = sentence
                |> remove_punctuation()
                |> replace_underscores()
                |> String.downcase()
                |> String.split()

    words_with_count(word_list, %{})
  end

  defp words_with_count([word | rest_of_list], word_tally) do
    current_value = word_tally[word] || 0

    words_with_count(rest_of_list, Map.put(word_tally, word, current_value + 1))
  end

  defp words_with_count([], map) do
    map
  end

  defp remove_punctuation(sentence) do
    String.replace(sentence, ~r/[:!&@$%^,]/, "")
  end

  defp replace_underscores(sentence) do
    String.replace(sentence, ~r/_/, " ")
  end
end
