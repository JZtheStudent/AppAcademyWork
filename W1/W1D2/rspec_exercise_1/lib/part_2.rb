def hipsterfy(word)
    vowels = ["a", "e", "i", "o", "u"]
    reversed = word.reverse
    (0...reversed.length).each do |i|
        if vowels.include?(reversed[i])
            reversed[i] = ""
            return reversed.reverse
        end 
    end
    word
end


def vowel_counts(str)
    res = Hash.new(0)
    str.downcase!
    vowels = ["a", "e", "i", "o", "u"]
    (0...str.length).each do |i|
        if vowels.include?(str[i])
            res[str[i]] += 1
        end 
    end 
    res
end 

def caesar_cipher(message, num)
    alpha = ("a".."z").to_a 
    res = ""

    message.each_char do |char|
        if alpha.include?(char)
            newIdx = (alpha.index(char) + num) % 26
            res += alpha[newIdx]
        else
            res += char
        end
    end 
    res
end 

