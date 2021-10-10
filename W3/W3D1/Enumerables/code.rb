class Array

    def my_each(&prc)
        idx = 0

        while idx < self.length
            prc.call(self[idx])
            idx += 1
        end
        self
    end
    
    def my_select(&prc)
        selected = []
        self.my_each { |ele| selected << ele if prc.call(ele) }
        selected
    end

    def my_reject(&prc)
        selected = []
        self.my_each { |ele| selected << ele unless prc.call(ele) }
        selected
    end

    def my_any?(&prc)
        self.my_each { |ele| return true if prc.call(ele) }
        return false
    end

    def my_all?(&prc)
        self.my_each { |ele| return false unless prc.call(ele) }
        return true
    end

    def my_flatten
        return [self] if !self.is_a?(Array)

        flattened = []
        self.each {|sub| sub.is_a?(Array) ? flattened += sub.my_flatten : flattened << sub }
        flattened
    end

    def my_zip(*arrs)
        zipped = Array.new

        (0...self.length).each do |index|
            current_arr = []
            current_arr << self[index]
            arrs.each {|arr| current_arr << arr[index]}
            zipped << current_arr
        end

        zipped
    end

    def my_rotate(num=1)
        num > 0 ? positive = true : positive = false
        new_arr = Marshal.load(Marshal.dump(self))

        num = num.abs % self.length

        num.times do 
            if positive
                new_arr << new_arr.shift
            else
                new_arr.unshift(new_arr.pop)
            end
        end

        new_arr
    end

    def my_join(sep="")
        joined = ""
        (0...self.length-1).each { |index| joined << self[index] + sep}
        joined << self[-1]
        joined
    end

    def my_reverse
        reversed = []
        self.each { |ele| reversed.unshift(ele) }
        reversed
    end

    def bubble_sort!(&prc)
        prc ||= Proc.new { |a, b| a <=> b }
        sorted = false 
        while !sorted 
            sorted = true
            (0...self.length - 1).each do |i|
               if prc.call(self[i], self[i + 1]) == 1
                    sorted = false
                    self[i], self[i + 1] = self[i + 1], self[i]
               end
            end
        end
        self
    end

    def bubble_sort(&prc)
        new_arr = Marshal.load(Marshal.dump(self))
        new_arr.bubble_sort!(prc)
        new_arr
    end

end


def factors(num)
    factors = []
    (1..num).each { |factor| factors << factor if num % factor == 0 }
    factors
end