class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    @phrase.split.inject(Hash.new(0)) { |c,w| c[w] +=1; c }
  end
end