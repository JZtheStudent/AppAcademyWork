def zip(*arrs)
    numSubArrs = arrs[0].length
    res = Array.new(numSubArrs) {[]}
    (0...numSubArrs).each do |i|
        arrs.each do |arr|
            res[i] << arr[i]
        end
    end
    res
end

def prizz_proc(arr, prc1, prc2)
    res = []
    arr.each do |ele|
        if prc1.call(ele)
            res << ele if !prc2.call(ele)
        else 
            res << ele if prc2.call(ele)
        end
    end
    res
end

def zany_zip(*arrs)
    size = arrs.map(&:size).max 
    res = Array.new(size) { [] }
    (0...size).each do |i|
        arrs.each do |arr|
            if i < arr.length then res[i] << arr[i] else res[i] << nil 
            end
        end
    end
    res
end

def maximum(arr, &prc)
    return nil if arr.length == 0
    curMaxEle = arr[0]
    curMax = prc.call(arr[0])
    arr.each do |ele| 
        if prc.call(ele) >= curMax
            curMaxEle, curMax = ele, prc.call(ele)
        end
    end    
    curMaxEle
end

def my_group_by(arr, &prc)
    res = Hash.new { |h, k| h[k] = []}
    arr.each { |ele| res[prc.call(ele)] << ele}
    res
end

def max_tie_breaker(arr, prc1, &prc2)
    return nil if arr.length == 0
    curMaxEle = arr[0]
    arr.each do |ele|
        cur, curMax = prc2.call(ele), prc2.call(curMaxEle)
        if cur > curMax
            curMaxEle = ele
        elsif cur == curMax && prc1.call(ele) > prc1.call(curMaxEle)
            curMaxEle = ele
        end
    end
    curMaxEle
end

def silly_syllables(sentence)
    vowels = "aeiou"
    sentence = sentence.split(" ")
    (0...sentence.length).each do |i|
        word = sentence[i]
        l, r = 0, word.length - 1
        while l < word.length && !vowels.include?(word[l])
            l += 1
        end
        while r >= 0 && !vowels.include?(word[r])
            r -= 1
        end
        sentence[i] = word[l..r] if l < r 
    end
    sentence.join(" ")

end