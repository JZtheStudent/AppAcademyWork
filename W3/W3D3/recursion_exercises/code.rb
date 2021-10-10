require "set"

def range(first, last)
    return [] if first >= last
    [first] + range(first + 1, last)
end

def iter_sum_arr(arr)
    count = 0
    arr.each { |ele| count += ele}
    count 
end

def recur_sum_arr(arr)
    return 0 if arr.empty?
    return arr[0] if arr.length == 1
    arr[0] + recur_sum_arr(arr[1..-1])
end

def exp_ver_1(b, n)
    return 1 if n == 0
    b * exp_ver_1(b, n - 1)
end

def exp_ver_2(b, n)
    return 1 if n == 0
    if n.even?
        exp_ver_2(b, n / 2) ** 2
    else
        b * (exp_ver_2(b, (n - 1) / 2) ** 2)
    end

end

class Array
    def deep_dup
        copy = []
        self.each do |ele|
            if ele.is_a? Array
                copy << ele.deep_dup
            else
                copy << ele
            end
        end
        copy
    end
end

def fib(n)
    return [0] if n == 1
    return [0, 1] if n == 2
    last = fib(n-1)
    last << last[-1] + last[-2]
end


def bsearch(array, target)
    
    return nil if array.empty?
 
    idx = array.length / 2

    return idx if array[idx] == target

    if array[idx] > target
        bsearch(array[0...idx], target) 
    else
        right_search = bsearch(array[idx + 1..-1], target)
        right_search.nil? ? nil : right_search + idx + 1
    end

end

def merge_sort(arr)
    return arr if arr.length <= 1
    mid = arr.length / 2
    first_half = merge_sort(arr[0...mid])
    second_half = merge_sort(arr[mid..-1])
    merge(first_half, second_half)
end

def merge(arr1, arr2)
    sorted = []
    while !arr1.empty? && !arr2.empty?
        if arr1.first < arr2.first
            sorted << arr1.shift
        else
            sorted << arr2.shift 
        end
    end
    sorted + arr1 + arr2 
end

def subsets(arr)
    return [[]] if arr.empty?
    result, subset = [], []
    idx = 0
    subsets_helper(arr, idx, subset, result)
    result
end

def subsets_helper(arr, idx, subset, result)
    result << subset.dup
    (idx...arr.length).each do |i|
        subset << arr[i]
        subsets_helper(arr, i+1, subset, result)
        subset.pop
    end
end

def perm_arr(arr)
    return [arr] if arr.length <= 1
    result = []
    arr.each_index do |i|
        cur = arr[i]
        others = arr.take(i) + arr.drop(i + 1)
        perm_arr(others).each do |p|
            result << ([cur] + p)
        end
    end
    result
end 

def greedy_make_change(change, coins)
    return [] if change == 0
    return [] if coins.none? { |coin| coin <= change }
    coins.each do |coin|
        if change >= coin
            return [coin] + greedy_make_change(change - coin, coins)
        end
    end
end

def make_better_change(change, coins)
    return [] if change == 0
    optimal_change = []
    coins.each do |coin|
        next if coin > change
        remainder = make_better_change(change - coin, coins)
        possible_solution = [coin] + remainder      
        if possible_solution.length < optimal_change.length || optimal_change.empty?
            optimal_change = possible_solution
        end
    end
    optimal_change
end