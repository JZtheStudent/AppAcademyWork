
class HumanPlayer

    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value 
    end

    def get_position
        error = "Invalid Format"
        puts "Player #{@mark}, enter two numbers representing a position in the format 'row col' "
        userInput = gets.chomp.split(" ")
        row, col = userInput[0], userInput[1]
        raise error if row == nil or col == nil
        raise error if row != "0" && row.to_i == 0
        raise error if col != "0" && col.to_i == 0
        return [row.to_i, col.to_i]     
    end

end

