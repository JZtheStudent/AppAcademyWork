require "byebug"
require "set"

#PHASE 1

def some?(arr, &prc)
    arr.each { |ele| return true if prc.call(ele)}
    false
end

def exactly?(arr, n, &prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele)}
    count == n
end

def filter_out(arr, &prc)
    res = []
    arr.each { |ele| res << ele if !prc.call(ele)}
    res
end

def at_least?(arr, n, &prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele)}
    count >= n
end

def every?(arr, &prc)
    arr.each { |ele| return false if !prc.call(ele)}
    true
end

def at_most?(arr, n, &prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele)}
    count <= n
end

def first_index(arr, &prc)
    (0...arr.length).each { |i| return i if prc.call(arr[i])}
    nil
end

#PHASE 2

def xnor_select(arr, prc1, prc2)
    res = []
    arr.each { |ele| res << ele if (prc1.call(ele) && prc2.call(ele)) || !(prc1.call(ele) || prc2.call(ele))}
    res
end 

def filter_out!(arr, &prc)
    (0...arr.length).each { |i| arr[i] = nil if prc.call(arr[i])}
    arr.delete(nil)
    arr
end

def multi_map(arr, n=1, &prc)
    n.times { (0...arr.length).each { |i| arr[i] = prc.call(arr[i])} }
    arr
end

def proctition(arr, &prc)
    arrTrue, arrFalse = [], []
    arr.each do |ele| 
        if prc.call(ele)
            arrTrue << ele 
        else 
            arrFalse << ele
        end
    end
    arrTrue + arrFalse
end

#PHASE 3

def selected_map!(arr, prc1, prc2)
    (0...arr.length).each do |i|
        if prc1.call(arr[i])
            arr[i] = prc2.call(arr[i])
        end
    end 
    nil
end 

def chain_map(v, arr)
    arr.inject(v) { |acc, prc| prc.call(acc)}
end

add_5 = Proc.new { |n| n + 5 }
half = Proc.new { |n| n / 2.0 }
square = Proc.new { |n| n * n }

def proc_suffix(sentence, h)
    sArray = sentence.split(" ")
    (0...sArray.length).each do |i|
        curStr = sArray[i]
        h.each { |prc, str| sArray[i] += str if prc.call(curStr)}
    end
    sArray.join(" ")
end

def proctition_platinum(arr, *prcs)
    reached = Set.new
    prcTracker = Hash.new
    numPrcs = 0
    res = Hash.new 

    prcs.each do |prc|
        numPrcs += 1
        prcTracker[prc] = numPrcs
        res[prcTracker[prc]] = []
        arr.each do |ele|
            if prc.call(ele) && !reached.include?(ele)
                res[prcTracker[prc]] << ele
                reached.add(ele)
            end
        end
    end
    res
end

def procipher(sentence, h)
    sArray = sentence.split(" ")
    (0...sArray.length).each do |i|
        curStr = sArray[i]
        h.each { |k, v| sArray[i] = v.call(sArray[i]) if k.call(curStr)}
    end 
    sArray.join(" ")

end

def picky_procipher(sentence, h)
    changed = Set.new
    sArray = sentence.split(" ")
    (0...sArray.length).each do |i|
        curStr = sArray[i]
        h.each do |k, v| 
            if k.call(curStr) && !changed.include?(curStr)
                sArray[i] = v.call(sArray[i])
                changed.add(curStr)
            end 
        end
    end 
    sArray.join(" ")
end

