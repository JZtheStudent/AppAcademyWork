class Board

    attr_reader :size

    def initialize(size)
        @size = size 
        @grid = Array.new(size) { Array.new(size) }
    end

    def [](pos)
        row, col = pos[0], pos[1] 
        @grid[row][col]
    end

    def []=(pos, mark)
        row, col = pos[0], pos[1]
        @grid[row][col] = mark 
    end

    def complete_row?(mark)
        @grid.each { |row| return true if row.all? { |item| item == mark } }
        return false
    end

    def complete_col?(mark)
        (0...size).any? do |i|
            return true if (0...size).all? { |j| @grid[j][i] == mark }
        end
        return false
    end

    def complete_diag?(mark)
        return true if (0...size).all? { |i| @grid[i][i] == mark }
        return true if (0...size).all? { |i| @grid[i][size - 1 - i] == mark }
        false
    end

    def winner?(mark)
        complete_row?(mark) || complete_col?(mark) || complete_diag?(mark)
    end


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
