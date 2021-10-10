require "byebug"


# O(n ^ 2)
def my_min_first(arr)
    arr.each do |i|
        return i if arr.all? { |j| i <= j }
    end
end

# O(n)
def my_min_second(arr)
    min = 9999999
    arr.each do |i|
        min = i if i <= min 
    end
    min 
end

# O(n ^ 2)
def largest_contiguous_subsum_first(list)
    sub_arrays = []
    (0...list.length).each do |i|
        (i...list.length).each do |j|
            sub_arrays << (list[i..j])
        end
    end
    sub_sums = []
    sub_arrays.each { |ele| sub_sums << ele.sum }
    p sub_arrays
    p sub_sums
    sub_sums.max
end

# O(n)
def largest_contiguous_subsum_second(list)
    max_result, max_current = -99999999
    list.each do |ele|
        max_current = [ele, ele + max_current].max 
        max_result = [max_result, max_current].max
    end
end


