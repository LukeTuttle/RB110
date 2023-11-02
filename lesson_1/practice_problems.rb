# from 'Practice Problems: Additional Practice'

# P1 
# turn the array into a hash where the
#items are the keys and the values are the item's position in the array

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = {}
flintstones.each_with_index { |name, pos| flintstones_hash[name] = pos + 1}
p flintstones_hash

# P2
# add up all the ages from the muster family hash
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.values.reduce(:+)

# P3
# remove people with age 100 and greater
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.select {|name, age| age < 100}.to_h

#  P4
#  Pick out the minimum age from our current Muster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.values.min

# P5
# find the index of the first name that starts with "Be"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
index_of_target = nil
flintstones.each_with_index {|name, index| index_of_target = index if name[0,2] == 'Be'} 
p index_of_target

# P6
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! {|name| name[0,3]}
p flintstones

# P7
statement = "The Flintstones Rock"

character_counts = statement.chars.uniq.each_with_object({}) do |char, hash|
  hash[char] = statement.count(char)
end

p character_counts

# P8
# 1
# 3

# 1
# 2

# P9
def titleize(string)
  string = string.split.map do |word|
    word[0] = word[0].upcase
    word
  end
  string.join(' ')
end

p titleize("the flintstones rock")

# P10
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_pair do |key, value|
  current_age = value['age']
  value['age_group'] = case current_age 
                       when 0...18
                         'kid'
                       when 18...65
                         'adult'
                       else
                         'senior'
                       end
end


expected_result = { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
"Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
"Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
"Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
"Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

p munsters == expected_result