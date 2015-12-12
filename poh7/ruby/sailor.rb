input_word_count = gets.to_i

words = []
input_word_count.times {
  words.push(gets.chomp)
}

puts words.join('-')
