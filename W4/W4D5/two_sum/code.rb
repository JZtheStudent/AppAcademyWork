require "set"

# O(N ^ 2) where N is length of arr
def bad_two_sum?(arr, target)
    (0...arr.length - 1).each do |i| 
        (i + 1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target 
        end
    end
    false
end

# O(N log N). Searching the sorted array is O(N)
def okay_two_sum?(arr, target)
    sorted = arr.sort
    left, right = 0, arr.length - 1

    while left < right 
        sum = sorted[left] + sorted[right]
        if sum == target
            return true
        elsif sum < target
            left += 1
        else
            right -= 1
        end
    end
    false
end

# O(N)
def two_sum?(arr, target)
    reached = Set.new
    arr.each do |num|
        return true if reached.include?(target - num)
        reached.add(num)
    end
end
