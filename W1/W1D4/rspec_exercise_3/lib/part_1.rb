
def is_prime?(n)
    return false if n < 2
    return true if n == 2
    (2...n).each { |i| return false if n % i == 0}
    true
end

def nth_prime(n)
    count = 0
    i = 1
    while count < n 
        i += 1
        if is_prime?(i)
            count += 1
        end    
    end 
    i
end

def prime_range(min, max)
    res = []
    (min..max).each { |num| res << num if is_prime?(num) }
    res
end