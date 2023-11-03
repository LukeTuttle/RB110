# p1
arr = ['10', '11', '9', '7', '8']
p arr.sort {|a,b| b.to_i <=> a.to_i}

# p2
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

puts(books.sort_by do |hash|
  puts hash[:published].to_i
  hash[:published].to_i
end)

# p3
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
p arr1[2][1].last
arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
p arr2[1][:third].first
arr3 = [['abc'], ['def'], {third: ['ghi']}]
p arr3[2][:third][0][0]
hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
p hsh1['b'].last
hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
p hsh2[:third].keys.first

# p4
arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
p arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4
p arr2

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
p hsh2

# p5
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

sum_of_ages = munsters.reduce(0) do |sum, (_, details)|
  if details['gender'] == 'male'
    sum + details['age']
  else
    sum + 0
  end
end

p sum_of_ages


# p6
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_pair do |name, details|
  puts "#{name} is a #{details['age']} year old #{details['gender']}"
end

# p7
#  a = 2
# b = [3, 8]

# p8
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
hsh.each_pair do |_, arr|
  arr.each do |str|
    str.chars.each do |char|
      puts char if 'aeiouAEIOU'.include?(char)
    end
  end
end

# p9
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
sorted_arr = arr.map do |arr|
  arr.sort {|a,b| b <=> a}
end

p sorted_arr

# p10
a = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
b = a.map do |hash|
   copy = hash.clone
   copy.each_pair {|key, value| copy[key] += 1}
   copy
end

p a
p b

# p11
arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

new_arr = arr.map do |subarr|
  subarr.select do |el|
    el % 3 == 0
  end
end

p new_arr

# p12
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

hsh_from_arr = arr.each_with_object({}) do |subarr, hsh|
  hsh[subarr.first] = subarr[1]
end

p hsh_from_arr

# p13
arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
sorted_arr = arr.sort_by do |subarr|
  subarr.select(&:odd?)
end

p sorted_arr

# p14
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = []
hsh.each_value do |details|
  addition = 
  case details[:type]
  when 'fruit'
      details[:colors].map(&:capitalize)
  when 'vegetable'
      details[:size].upcase
  end
  arr << addition
end

p arr

# p15
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

new_arr = arr.select do |hsh|
  hsh.values.flatten.all?(&:even?)
end

p new_arr

# p16
def generate_uuid()
  dash_indexes = [8,13,18,23]
  uuid = []
  36.times do |n|
    if dash_indexes.include?(n)
      uuid << '-'
    else
      uuid << [('a'..'f').to_a, (0..9).to_a].flatten.sample
    end
  end
  uuid.map!(&:to_s).join
end

p generate_uuid
