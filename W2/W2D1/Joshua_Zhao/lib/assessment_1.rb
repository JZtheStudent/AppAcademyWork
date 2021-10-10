

def my_map!(arr, &prc)
    (0...arr.length).each { |i| arr[i] = prc.call(arr[i]) }
    arr
end

def two?(arr, &prc)
    count = 0
    arr.each do |ele|
        count += 1 if prc.call(ele)
        return false if count > 2
    end
    return true if count == 2
    false
end

def nor_select(arr, prc1, prc2)
    res = []
    arr.each { |ele| res << ele if !(prc1.call(ele) || prc2.call(ele))}
    res
end

def array_of_hash_sum(arr)
    sum = 0
    arr.each do |h|
        h.each {|k, v| sum += v } 
    end
    sum
end

def slangify(sentence)
    vowels = "aeiou"
    sentence = sentence.split(" ")
    (0...sentence.length).each do |i|
        word, idx = sentence[i], 0
        while idx < word.length && !vowels.include?(word[idx])
            idx += 1
        end
        if idx < word.length && vowels.include?(word[idx])
            sentence[i] = word[0...idx] + word[idx + 1..-1]
        end
    end
    sentence.join(" ")

end

def char_counter(str, *chars)
    res = Hash.new(0)
    if chars.length == 0
        str.each_char { |char| res[char] += 1}
    else
        str.each_char do |char| 
            if chars.include?(char) 
                if res.include?(char) then res[char] += 1 else res[char] = 1
                end
            end
        end
    end
    chars.each { |char| res[char] = 0 if !res.include?(char)}
    res
end


