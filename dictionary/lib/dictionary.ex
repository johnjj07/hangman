defmodule Dictionary do
  alias Dictionary.WordList

  defdelegate random_word(word_list), to: WordList
end
