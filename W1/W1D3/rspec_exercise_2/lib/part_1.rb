

def partition(arr, num)
    res = [[], []]
    arr.each do |ele|
        if ele < num
            res[0] << ele 
        else 
            res[1] << ele 
        end 
    end 
    res 
end

def merge(hash1, hash2)
    res = Hash.new
    hash1.each { |k, v| res[k] = v}
    hash2.each { |k, v| res[k] = v}
    res
end

def censor(sentence, curses)
    vowels = "aeiou"
    sentence = sentence.split(" ").each do |word|
        if curses.include?(word.downcase)
            (0...word.length).each do |i|
                if vowels.include?(word[i].downcase)
                    word[i] = "*"
                end 
            end 
        end 
    end
    sentence.join(" ") 
end

def power_of_two?(num)
    cur = 1
    while cur <= num
        return true if cur == num 
        cur *= 2 
    end
    return false
end