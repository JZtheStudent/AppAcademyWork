# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "prime"
require "byebug"

def largest_prime_factor(num)
    (3...num).reverse_each do |i|
        if num % i == 0 && i.prime?
            return i 
        end
    end
    num
end 

def unique_chars?(str)
    reached = Set.new
    str.each_char do |char|
        if reached.include?(char)
            return false 
        else 
            reached.add(char)
        end 
    end
    true
end 

def dupe_indices(arr) 
    res = Hash.new
    (0...arr.length).each do |i|
        if res.include?(arr[i])
            res[arr[i]].append(i)
        else
            res[arr[i]] = [i]
        end
    end
    res.select {|k,v| v.length > 1}
end 

def ana_array(arr1, arr2)
    set1 = Set.new 
    set2 = Set.new 

    arr1.each {|ele| set1.add(ele)}
    arr2.each {|ele| set2.add(ele)}

    set1 == set2

end
