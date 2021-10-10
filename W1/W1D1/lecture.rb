nums = [1, 2, 3, 4, 5]

def all_numbers_even?(nums)
    nums.each do |num|
        return false if num % 2 != 0
    end

    true
end

 p all_numbers_even? nums 


 def method(arg_1, arg_2, *other_args)
    p arg_1         # "a"
    p arg_2         # "b"
    p other_args    # ["c", "d", "e"]
end

method("a", "b", "c", "d", "e") 