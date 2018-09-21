print "How old are you? "
age = gets.chomp
print "How tall are you? "
height = gets.chomp.to_i*2.54

# I like feet and inches better.
# puts "How tall are you?"
# print "Feet: "
# feet = gets.chomp
# print "inches: "
# inches = gets.chomp
# height = "#{feet}\'#{inches}\""

print "How much do you weigh? "
weight = gets.chomp.to_i*0.454

puts "\nSo, you're #{age} old, #{height.round} tall and #{weight.round(2)} heavy."
