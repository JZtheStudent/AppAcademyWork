class Board

    def self.build_stacks(num)
        Array.new(num) {Array.new([])}
    end

    attr_reader :max_height 

    def initialize(num, height)
        raise "rows and cols must be >= 4" if num < 4 || height < 4
        @stacks = Board.build_stacks(num)
        @max_height = height
    end

    def add(token, idx)
        return false if @stacks[idx].length >= max_height 
        @stacks[idx] << token 
        true
    end


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end

    def vertical_winner?(token)
        @stacks.each do |stack|
            if stack.length == max_height
                return true if stack.all? { |ele| ele == token }
            end
        end
        return false 
    end
    
    def horizontal_winner?(token)
        begin 
            (0...max_height).each do |h|
                return true if @stacks.all? { |stack| stack[h] == token }
            end
            return false
        rescue
            return false 
        end
    end

    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end

end
