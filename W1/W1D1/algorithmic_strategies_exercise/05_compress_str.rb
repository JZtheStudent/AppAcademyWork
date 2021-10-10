# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    res = ""
    curChar = str[0]
    curCharCount = 1
    (1...str.length).each do |i|
        if str[i] != curChar 
            res += add_to_result(curChar, curCharCount)
            curChar, curCharCount = str[i], 1 
            
        else 
            curCharCount += 1
        end 
    end 
    res += add_to_result(curChar, curCharCount)
    res 
end 

def add_to_result(curChar, curCharCount)
    if curCharCount == 1 then curChar else String(curCharCount) + curChar 
    end
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
