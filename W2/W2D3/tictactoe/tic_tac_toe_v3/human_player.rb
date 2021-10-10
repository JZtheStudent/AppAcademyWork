
class HumanPlayer

    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value 
    end

    def get_position(legal_positions)
        error = "Invalid Position\n\n"
        done = false
        while !done
            puts "Player #{@mark}, enter two numbers representing a position in the format 'row col' "
            userInput = gets.chomp.split(" ")
            row, col = userInput[0], userInput[1]
            if row == nil || col == nil || (row != "0" && row.to_i == row) || (col != "0" && col.to_i == row) || !legal_positions.include?([row.to_i, col.to_i])
                puts error
                next
            else
                return [row.to_i, col.to_i]  
            end
        end
        
    end

end

