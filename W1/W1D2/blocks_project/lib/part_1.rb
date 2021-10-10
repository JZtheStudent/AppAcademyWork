

def select_even_nums(arr)
    arr.select {|ele| ele.even? }
end

def reject_puppies(dogs)
    dogs.reject {|dog| dog["age"] <= 2 }
end

def count_positive_subarrays(array2D)
    array2D.count { |arr| arr.sum > 0 }
end

def aba_translate(word)
    vowels = "aeiou"
    res = ""
    word.each_char do |char|
        if vowels.include?(char)
            res += char + "b" + char 
        else 
            res += char 
        end
    end 
    res
end

def aba_array(arr)
    arr.map { |word| aba_translate(word) }
end
