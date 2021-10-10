
def proper_factors(n)
    res = []
    (1...n).each { |i| res << i if n % i == 0}
    res
end

def aliquot_sum(n)
    proper_factors(n).sum
end

def perfect_number?(n)
    n == aliquot_sum(n)
end

def ideal_numbers(n)
    res = []
    count, i = 0, 1
    while count < n
        if perfect_number?(i)
            res << i 
            count += 1
        end
        i += 1
    end 
    res 
end