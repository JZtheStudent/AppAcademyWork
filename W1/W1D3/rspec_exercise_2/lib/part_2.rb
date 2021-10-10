require "byebug"

def palindrome?(str)
    l, r = 0, str.length - 1
    while l <= r 
        return false if str[l] != str[r]
        l += 1
        r -= 1
    end 
    true
end

def substrings(str)
    res = []
    l = 0
    while l < str.length 
        r = l 
        while r < str.length 
            res << str[l..r]
            r += 1
        end
        l += 1
    end
    res
end

def palindrome_substrings(str)
    subs = substrings(str)
    subs.select { |sub| sub.length > 1 && palindrome?(sub) }
end