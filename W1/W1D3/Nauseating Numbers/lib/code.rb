require 'set'
require 'byebug'
require "prime"

def test(str)
    str 
end

#PHASE 1

def strange_sums(arr)
    res = 0
    reached = Set.new 
    arr.each do |num|
        res += 1 if reached.include?(-1 * num)
        reached.add(num)
    end 
    res
end

def pair_product(numbers, prod)
    reached = Set.new 
    numbers.each do |num|
        return true if reached.include?((1.0 * prod) / num)
        reached.add(num * 1.0)
    end 
    false
end

def rampant_repeats(string, h)
    res = ""
    string.each_char do |char|
        if h.include?(char)
            res += char * h[char]
        else 
            res += char 
        end 
    end 
    res

end

def perfect_square?(num)
    (0..num).each do |n|
        if n * n == num
            return true 
        end
        if n * n > num 
            return false 
        end 
    end
end

#PHASE 2

def anti_prime?(num)
    numDivisors = 0
    (1..num).each do |i|
        if num % i == 0
            numDivisors += 1
        end 
    end 
    (1..num).each do |i|
        if num % i != 0
            curDivisors = 0
            (1..i).each do |j|
                if i % j == 0
                    curDivisors += 1
                    return false if curDivisors > numDivisors 
                end 
            end 
        end 
    end 
    return true
end

def matrix_addition(m1, m2)
    h, w = m1.length, m1[0].length 
    res = Array.new(h) { Array.new(w, 0) }
    
    (0...h).each do |i|
        (0...w).each do |j|
            res[i][j] = m1[i][j] + m2[i][j]
        end 
    end 
    res

end

def mutual_factors(*args)
    biggest = args.max 
    res = []
    (1..biggest).each do |i|
        if args.all? { |num| num % i == 0 }
            res << i 
        end
    end     
    res

end

def tribonacci_number(num)
    return 1 if [1, 2].include?(num)
    return 2 if num == 3

    prev3, prev2, prev1 = 1, 1, 2
    curIteration = 4
    curSum = 4
    while curIteration < num
        prev3, prev2, prev1 = prev2, prev1, curSum
        curSum = [prev3, prev2, prev1].sum
        curIteration += 1
    end
    curSum
end

#PHASE 3

def matrix_addition_reloaded(*args)
    h, w = args[0].length, args[0][0].length
    args.each do |matrix|
        return nil if matrix.length != h || matrix[0].length != w 
    end
    
    res = res = Array.new(h) { Array.new(w, 0) }
    (0...h).each do |i|
        (0...w).each do |j|
            args.each do |matrix|
                res[i][j] += matrix[i][j]
            end
        end 
    end
    res
end

def squarocol?(matrix)
    l = matrix.length 
    #check rows
    matrix.each do |row|
        first = row[0]
        return true if row.all? { |ele| ele == first}
    end
    #check columns
    (0...l).each do |i|
        first = matrix[0][i]
        (0...l).each do |j|
            break if matrix[j][i] != first
            return true if j == l - 1
        end
    end
    false
end


def squaragonal?(matrix)
    l = matrix.length

    first = matrix[0][0]
    i, j = 0, 0
    while i < l
        break if matrix[i][j] != first   
        return true if i == l - 1
        i += 1
        j += 1
    end 

    first = matrix[0][l - 1]
    i, j = 0, l - 1
    while i < l
        break if matrix[i][j] != first 
        return true if i == l - 1
        i += 1
        j -= 1
    end 
    false
end

def pascals_triangle(num)
    return [[1]] if num == 1
    res = [[1], [1, 1]]
    return res if num == 2

    curLevels = 2
    while curLevels < num
        curArr = [1]
        (1...curLevels).each do |i|
            curNum = res[-1][i - 1] + res[-1][i]
            curArr << curNum 
        end 
        curArr << 1
        res << curArr
        curLevels += 1 
    end 
    res
end

#PHASE 4

def mersenne_prime(num)
    count = 0
    res = 0
    curExp = 2
    while count < num
        curCal = (2 ** curExp) - 1
        if curCal.prime?
            count += 1
            res = curCal
        end 
        curExp += 1
    end 
    res
end

def triangular_word?(word)
    alpha = "abcdefghijklmnopqrstuvwxyz"
    num = 0
    word.each_char { |char| num += alpha.index(char) + 1 }
    i = 1
    while ((i * (i + 1)) / 2) < num 
        i += 1
    end 
    return false if ((i * (i + 1.0)) / 2.0) > num
    true
end

def consecutive_collapse(arr)
    done = false 
    while !done 
        cur, i, changed = [], 0, false
        while i < arr.length
            if changed
                cur << arr[i]
                i += 1
            elsif (i + 1 < arr.length) && ((arr[i] == arr[i + 1] + 1) || (arr[i] == arr[i + 1] - 1))
                i += 2
                changed = true
            else 
                cur << arr[i]
                i += 1
            end 
        end
        arr = cur 
        done = true if !changed 
    end
    arr

end

def pretentious_primes(arr, n)
    if n > 0
        (0...arr.length).each do |i|
            num = arr[i] + 1
            count = 0
            while count < n
                count += 1 if num.prime?
                num += 1
            end
            num -= 1
            arr[i] = num 
        end 
    else 
        (0...arr.length).each do |i|
            num = arr[i] - 1
            count = 0
            while num >= 2 and count < (-1) * n
                count += 1 if num.prime?
                num -= 1
            end 
            if count == (-1) * n
                arr[i] = num + 1
            else 
                arr[i] = nil 
            end
        end
    end
    arr 
end