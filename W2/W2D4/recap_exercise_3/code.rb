require "prime"
require "byebug"

#GENERAL PROBLEMS

def no_dupes?(arr)
    counts = Hash.new(0)
    arr.each { |ele| counts[ele] += 1}
    arr.select { |ele| counts[ele] == 1 }
end

def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each { |i| return false if arr[i] == arr[i + 1]}
    true
end

def char_indices(str)
    h = Hash.new { |h, k| h[k] = Array.new }
    (0...str.length).each { |i| h[str[i]] << i }
    h
end

def longest_streak(str)
    curLongest, curLength, front = "", 0, 0
    while front < str.length
        back = front
        while back < str.length && str[back] == str[front]
            back += 1
        end
        if back - front >= curLength
            curLength = back - front 
            curLongest = str[front...back]
        end
        front = back
    end
    curLongest

end

def bi_prime?(num)
    (2...num).each do |n|
        if num % n == 0 && n.prime?
            return true if (num / n).prime?
        end
    end
    false
end

def vigenere_cipher(message, keys)
    alpha = ("a".."z").to_a
    curKeyIdx = 0
    (0...message.length).each do |i|
        key, char = keys[curKeyIdx], message[i]
        message[i] = alpha[ (alpha.index(char) + key) % 26 ]
        if curKeyIdx >= keys.length - 1
            curKeyIdx = 0
        else
            curKeyIdx += 1
        end
    end
    message
end

def vowel_rotate(str)
    vowels, vowelIdxs = "aeiou", []
    (0...str.length).each { |i| vowelIdxs << i if vowels.include?(str[i])}
    lastVowel = str[vowelIdxs[-1]]
    (1...vowelIdxs.length).reverse_each do |i|
        str[vowelIdxs[i]] = str[vowelIdxs[i - 1]]
    end
    str[vowelIdxs[0]] = lastVowel 
    str
end

#PROC PROBLEMS

class String

    def select(&prc)
        return "" if prc == nil
        str = ""
        self.each_char { |char| str += char if prc.call(char) }
        str 
    end

    def map!(&prc)
        # (0...self.length).each { |i| self[i] = prc.call(self[i])}
        self.each_char.with_index do |char, i|
            self[i] = prc.call(char, i)
        end
    end

end

#RECURSION PROBLEMS

def multiply(a, b)
    return 0 if b == 0
    if b > 0
        return a + multiply(a, b - 1)
    else
        return a + multiply(a, b + 1)
    end
end

def prime_factorization(num)
    (2...num).each do |n|
        if num % n == 0
            compl = num / n 
            return [*prime_factorization(n), *prime_factorization(compl)]
        end
    end
    [num]
end