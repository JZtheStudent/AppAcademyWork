

def first_letter_vowel_count(sentence)
    vowels = "aeiou"
    count = 0
    sentence = sentence.downcase.split(" ")
    sentence.each do |word|
        count += 1 if vowels.include?(word[0])
    end
    count
end

def count_true(arr, prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele)}
    count
end

def procformation(arr, prc1, prc2, prc3)
    (0...arr.length).each do |i|
        if prc1.call(arr[i])
            arr[i] = prc2.call(arr[i])
        else 
            arr[i] = prc3.call(arr[i])
        end
    end
    arr
end

def array_of_array_sum(arr)
    arr.flatten.sum
end

def selective_reverse(sentence)
    vowels = "aeiou"
    sentence = sentence.split(" ")
    (0...sentence.length).each do |i|
        word = sentence[i]
        if !(vowels.include?(word[0]) || vowels.include?(word[-1]))
            sentence[i] = word.reverse
        end
    end
    sentence.join(" ")
end

def hash_missing_keys(h, *args)
    res = []
    args.each do |arg|
        if !h.include?(arg)
            res << arg 
        end
    end
    res
end

