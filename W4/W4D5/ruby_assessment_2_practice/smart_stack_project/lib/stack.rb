
class Stack

    def initialize
        @underlying_array = [] 
    end

    def size
        underlying_array.length
    end
    
    def empty?
        return underlying_array.empty?
    end

    def top
        underlying_array.last
    end

    def peek(n)
        idx = size - 1
        peek_arr = []
        begin
            n.times do
                peek_arr << underlying_array[idx]
                idx -= 1
            end
        rescue
            return peek_arr 
        end
        peek_arr
    end

    def push(item)
        underlying_array << item
        size 
    end

    def pop
        return nil if underlying_array.empty?
        underlying_array.pop
    end

    private
    attr_accessor :underlying_array



end