first, second, third = ARGV

puts "Your first variable is: #{first}"
puts "Your second variable is: #{second}"
puts "Your third variable is: #{third}"

print "Does that look right? "
answer = $stdin.gets.chomp

puts "You said #{answer}."
