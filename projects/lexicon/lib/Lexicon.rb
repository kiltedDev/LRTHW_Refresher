class Lexicon
  def initialize()
    @directions = %w[north south east west up down left right back forward]
    @verbs = %w[go stop run kill eat swim]
    @stop_words = %w[ at the of in from ]
    @nouns = %w[bear princess cabinet door player]
    @numbers = "[0-9]+"
  end

  def scan (sentence)
    breakdown = []

    words = sentence.split

    words.each do |word|
      if @directions.include? word
        breakdown.push(["direction", word])
      elsif @verbs.include? word
        breakdown.push(["verb", word])
      elsif @stop_words.include? word
        breakdown.push(["stop", word])
      elsif @nouns.include? word
        breakdown.push(["noun", word])
      elsif word.match(@numbers)
        breakdown.push(["number", word.to_i])
      else
        breakdown.push(["error", word])
      end
    end

    breakdown
  end
end
