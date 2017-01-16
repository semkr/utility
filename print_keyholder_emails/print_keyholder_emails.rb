#!/usr/bin/ruby
#####################################################
# Author:  David Kirwan <davidkirwanirl@gmail.com>
# Github:  https://github.com/davidkirwan
# Licence: GPL 3.0
# Print the list of South East Makerspace email 
# for people who hold keys.
######################################################
require "csv"

csv_file = "/path/to/sems/membership.csv"
index = 0
max = 37
results = Array.new

puts "Printing the key holders at the South East Makerspace:"
CSV.foreach(csv_file) do |row|
  if index < max then results << row; end
  index += 1
end

key = results[0].find_index("Keys")
email = results[0].find_index("Email")

results.each do |i|
  if i[key] == "Yes" then puts i[email] + ","; end
end
