# Monkey-Patch Ruby's existing Array class to add your own custom methods
require "byebug"

class Array
  
    def span
        if self.empty? then return nil else return self.max - self.min 
        end
    end

    def average
        if self.empty? then return nil else return self.sum * 1.0 / self.length
        end
    end

    def median 
        return nil if self.empty?
        sorted, l = self.sort, self.length
        if self.length.even?
            return (sorted[l / 2] + sorted[(l / 2) - 1]) / 2.0
        else    
            return sorted[l / 2]
        end
    end

    def counts 
        h = Hash.new(0)
        self.each { |num| h[num] += 1 }
        h
    end

    def my_count(val)
        counts[val]
    end

    def my_index(val)
        (0...self.length).each do |i|
            return i if self[i] == val 
        end
        nil
    end

    def my_uniq 
        res = []
        self.each { |ele| res << ele if !res.include?(ele) }
        res
    end

    def my_transpose
        l = self.length 
        res = Array.new(l) { Array.new(l, nil)}
        (0...l).each do |i|
            (0...l).each do |j|
                res[i][j] = self[j][i]
            end
        end
        res
    end
end

