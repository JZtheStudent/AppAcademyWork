require_relative "stack.rb"


class SmartStack < Stack 

    def initialize(num)
        @underlying_array = []
        @max_size = num
    end
    
    def max_size
        @max_size 
    end
    
    def full?
        size == max_size     
    end

    def push(*args)
        raise "stack is full" if args.length > max_size - size 
        args.each { |arg| underlying_array << arg }
        size 
    end

    def pop(n=1)
        begin
            items = []
            n.times do 
                items << underlying_array.pop
            end
            return items
        rescue 
            until items.length == size 
                items << nil 
            end
            return items
        end
    end
    
    
    private
    attr_reader :underlying_array

end