# creates an integer variable for us to use later
types_of_people = 10
# said integer value is just used as part of a string here.
x = "There are #{types_of_people} types of people."
# here we create two strings
binary = "binary"
do_not = "don't"

# and here we use them to build another string, also the punchline
y = "Those who know #{binary} and those who #{do_not}."

puts x
puts y

puts "I said: #{x}."
puts "I also said: '#{y}'."

hilarious = false
joke_evaluation = "Isn't that joke so funny?! #{hilarious}"

puts joke_evaluation

w = "This is the left side of... "
e = "a string with a right side."

puts w + e
