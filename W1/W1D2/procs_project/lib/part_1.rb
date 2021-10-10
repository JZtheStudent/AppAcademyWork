require "byebug"

def my_map(arr, &prc)
    res = []
    arr.each { |ele| res << prc.call(ele) } 
    res
end

def my_select(arr, &prc)
    res = []
    arr.each { |ele| res << ele if prc.call(ele) }
    res
end

def my_count(arr, &prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele) }
    count 
end

def my_any?(arr, &prc)
    arr.each { |ele| return true if prc.call(ele) }
    false
end

def my_all?(arr, &prc)
    arr.each { |ele| return false if !prc.call(ele) }
    true
end

def my_none?(arr, &prc)
    arr.each { |ele| return false if prc.call(ele) }
    true
end