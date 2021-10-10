class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    if accumulator.nil?
      accumulator = self[0]
      (1...self.length).each do |idx|
        accumulator = prc.call(accumulator, self[idx])
      end
    else
      (0...self.length).each do |idx|
        accumulator = prc.call(accumulator, self[idx])
      end
    end
    accumulator

  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  (2...num).each { |n| return false if num % n == 0}
  true
end

def primes(num)
  return [] if num == 0
  return [2] if num == 1
  res = []
  curNum = 2
  while num > 0
    if is_prime?(curNum)
      num -= 1
      res << curNum 
    end
    curNum += 1
  end
  res
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  res = factorials_rec(num - 1)
  cur = res[-1] * (num - 1)
  res << cur
  res

end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    reached = Hash.new { |h, k| h[k] = []}
    self.each_with_index do |ele, idx|
      reached[ele] << idx 
    end
    reached.select { |k, v| v.length > 1}

  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    result = []
    (0...self.length - 1).each do |idx|
      (idx + 1..self.length - 1).each do |idx_2|
        substr = self[idx..idx_2]
        result << substr if substr == substr.reverse 
      end 
    end
    result 
  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
    prc ||= Proc.new { |a, b| a <=> b }

    return self if self.length <= 1
    mid = self.length / 2
    left = self[0...mid].merge_sort(&prc)
    right = self[mid..-1].merge_sort(&prc)
    Array.merge(left, right, &prc)

  end

  private
  def self.merge(left, right, &prc)
    merged = []
    while !left.empty? && !right.empty?
      if prc.call(left[0], right[0]) == - 1
        merged << left.shift
      else
        merged << right.shift
      end
    end
    merged += left + right

  end
end
