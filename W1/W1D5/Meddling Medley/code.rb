require "byebug"


#PHASE1

def duos(str)
    count = 0
    (0...str.length - 1).each { |i| count += 1 if str[i] == str[i + 1]}
    count
end

def sentence_swap(sentence, h)
    sentence = sentence.split(" ")
    (0...sentence.length).each { |i| sentence[i] = h[sentence[i]] if h.include?(sentence[i]) }
    sentence.join(" ")
end

def hash_mapped(h, prc1, &prc2)
    res = Hash.new
    h.each { |k, v| res[prc2.call(k)] = prc1.call(v) }
    res

end

def counted_characters(str)
    res = []
    h = Hash.new(0)
    str.each_char { |char| h[char] += 1 }
    h.each { |k, v| res << k if h[k] > 2 }
    res
end

def triplet_true?(str)
    return false if str.length < 3
    (0...str.length - 2).each do |i|
        return true if str[i] == str[i + 1] && str[i] == str[i + 2]
    end
    false
end

def energetic_encoding(str, h)
    (0...str.length).each do |i|
        if str[i] != " "
            if h.include?(str[i]) then str[i] = h[str[i]] else str[i] = "?"
            end
        end
    end
    str
end

def uncompress(str)
    res = ""
    (0...str.length).each { |i| res += str[i]*Integer(str[i + 1]) if i % 2 == 0}
    res
end

#PHASE 2

def conjunct_select(arr, *prcs)
    arr.select { |ele| prcs.all? { |prc| prc.call(ele) } }
end

def convert_pig_latin(sentence)
    vowels = "aeiouAEIOU"
    sentence = sentence.split(" ")
    (0...sentence.length).each do |i|
        word = sentence[i]
        if word.length >= 3
            isCapitalized = true if word[0] == word[0].capitalize
            if vowels.include?(word[0])
                sentence[i] = word + "yay"
            else
                idx = 0
                while idx < word.length && !vowels.include?(word[idx])
                    idx += 1
                end
                sentence[i] = word[idx...word.length] + word[0...idx] + "ay"
            end
            if isCapitalized
                sentence[i] = sentence[i].downcase.capitalize
            end
        end
    end
    sentence.join(" ")
end

def reverberate(sentence)
    vowels = "aeiouAEIOU"
    sentence = sentence.split(" ")
    (0...sentence.length).each do |i|
        word = sentence[i]
        if word.length >= 3
            isCapitalized = true if word[0] == word[0].capitalize
            if vowels.include?(word[-1])
                sentence[i] = word + word
            else
                idx = word.length - 1
                while idx >= 0 && !vowels.include?(word[idx])
                    idx -= 1
                end
                sentence[i] = word + word[idx...word.length]
            end
            if isCapitalized
                sentence[i] = sentence[i].downcase.capitalize
            end
        end
    end
    sentence.join(" ")
end

def disjunct_select(arr, *prcs)
    arr.select { |ele| prcs.any? { |prc| prc.call(ele) } }
end

def alternating_vowel(sentence)
    vowels = "aeiouAEIOU"
    sentence = sentence.split(" ")
    (0...sentence.length).each do |i|
        word = sentence[i]
        l = word.length
        if i % 2 == 0
            idx = 0
            while idx < l && !vowels.include?(word[idx])
                idx += 1
            end
        else 
            idx = l - 1
            while idx >= 0 && !vowels.include?(word[idx])
                idx -= 1
            end 
        end
        if idx >= l then sentence[i] = word[0...idx] else sentence[i] = word[0...idx] + word[idx + 1...l]
        end
    end
    sentence.join(" ")
end

def silly_talk(sentence)
    vowels = "aeiouAEIOU"
    sentence = sentence.split(" ")
    (0...sentence.length).each do |i|
        word = sentence[i]
        if vowels.include?(word[-1])
            sentence[i] = word + word[-1]
        else
            word = word.split("")
            (0...word.length).each { |i| word[i] = word[i] + "b" + word[i] if vowels.include?(word[i]) }
            sentence[i] = word.join("")
        end
    end 
    sentence.join(" ")
end

def compress(str)
    # debugger
    res = ""
    l = 0
    while l < str.length
        r = l 
        while r < str.length and str[l] == str[r]
            r += 1
        end 
        len = r - l
        if len > 1
            res += str[l] + String(len)
        else 
            res += str[l]
        end
        l = r
    end
    res
end 

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"