
# O(N!) to generate list of substrings
def first_anagram?(str_1, str_2)
    possible_strings = str_1.split("").permutation.to_a.map { |sub_arr| sub_arr.join("") } 
    possible_strings.include?(str_2) 
end 

# O(N ^ 2). Iterating over str_1 is O(N). Finding an index in str_2 is also O(N)
# Nesting those two operations makes the function O(N ^ 2)
def second_anagram?(str_1, str_2)
    str_1, str_2 = str_1.split(""), str_2.split("")
    str_1.each do |char|
        str_2_idx = str_2.find_index(char)
        return false if str_2_idx.nil?
        str_2 = str_2[0...str_2_idx] + str_2[str_2_idx + 1.. -1]
    end
    str_2 == []
end

# O(N log N) Ruby natively uses quicksort which is n log n. 
# There are also converting to Array and back to String, which
# are O(N) each, but we disregard this because it does not matter as much
# asymptotically
# This algorithm is far better than #second_anagram?
def third_anagram?(str_1, str_2)
    str_1.chars.sort.join == str_2.chars.sort.join
end

# O(N) Technically O(2N), but we drop the constant.
def fourth_anagram?(str_1, str_2)
    letters = Hash.new(0)
    str_1.each_char do |letter|
        letters[letter] += 1
    end
    str_2.each_char do |letter|
        if !letters.include?(letter) || letters[letter] <= 0
            return false
        end
        letters[letter] -= 1
    end
    letters.all? { |k,v| v == 0 }
end