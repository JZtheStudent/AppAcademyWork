# Write a method `savvy_shuffled_sentence?` that takes in two sentences.
# The method should return a boolean indicating whether or not the sentences
# consist of the same exact *words*, but not necessarily in the same order.
#
# Your solution should have a linear - O(n) runtime, where n is the combined
# length of the input strings.
#
# Scoring: 8 points maximum
#   4 points awarded for passing all test cases
#   4 points awarded for linear runtime
#
# This component of the assessment is estimated to take 10 minutes.

def savvy_shuffled_sentence?(sentence_1, sentence_2)
    reached = Hash.new(0)
    s_1, s_2 = sentence_1.split(" "), sentence_2.split(" ")
    s_1.each { |word| reached[word] += 1}
    s_2.each do |word|
        return false if !reached.include?(word) || reached[word] <= 0
        reached[word] -= 1
    end
    reached.all? { |k, v| v == 0 }

end



# Test Cases:
p savvy_shuffled_sentence?("there is no spoon", "spoon there is no") # true
p savvy_shuffled_sentence?("I do what I want to do", "I do what to want do I") # true
p savvy_shuffled_sentence?("cellar", "cellar") # true
p savvy_shuffled_sentence?("cellar door", "cellar door") # true
p savvy_shuffled_sentence?("silent", "listen") # false
p savvy_shuffled_sentence?("school master", "the classroom") # false
p savvy_shuffled_sentence?("I do what I want to do", "what I want to do") # false
p savvy_shuffled_sentence?("there is no spoon", "there is one spoon") # false
p savvy_shuffled_sentence?("what the what", "what the") # false
p savvy_shuffled_sentence?("what the", "what the what") # false
p savvy_shuffled_sentence?("thaw the thaw", "what the what") # false
