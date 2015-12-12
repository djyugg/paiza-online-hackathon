votes = []
5.times { votes.push(gets.chomp) }

vote_yes_count = votes.count { |vote| vote == 'yes' }
vote_no_count = votes.length - vote_yes_count

if (vote_yes_count > vote_no_count)
  puts 'yes'
else
  puts 'no'
end

