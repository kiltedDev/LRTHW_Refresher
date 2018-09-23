class Song

  def initialize(lyrics)
    @lyrics = lyrics
  end

  def sing_me_a_song()
    @lyrics.each {|line| puts line }
  end
end

happy_bday = Song.new([
  "Happy birthday to you",
  "I don't want to get sued",
  "So I'll stop right there"
])

bulls_on_parade = Song.new([
  "They rally around tha family",
  "With pockets full of shells"
])

johnny_jump_up = Song.new([
  "Oh never, oh never, oh never again",
  "If I live to a hundred or a hundred and ten",
  "I fell to the ground and I couldn't get up",
  "After drinking a pint of the Johnny Jump Up"
])

jon_gooch = [
  "I mean my heart's beating, my heart's beating",
  "My hands are shaking, my hands are shaking",
  "But I'm still shooting, and I'm still getting the head shots"
]

one_click_headshot = Song.new(jon_gooch)

happy_bday.sing_me_a_song()

puts

bulls_on_parade.sing_me_a_song()

puts

johnny_jump_up.sing_me_a_song()

puts

one_click_headshot.sing_me_a_song()
