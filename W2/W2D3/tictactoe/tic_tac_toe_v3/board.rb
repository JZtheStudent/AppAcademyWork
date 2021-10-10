
class Board

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, "_")}
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def valid?(pos)
        pos.each { |ele| return false if ele < 0 || ele >= @grid.length}
        true
    end

    def empty?(pos)
        self[pos] == "_"
    end 

    def place_mark(pos, mark)
        raise "Position not valid" if !valid?(pos)
        raise "That spot is already marked" if !empty?(pos)
        self[pos] = mark
    end

    def print
        puts ""
        @grid.each { |row| puts row.join(" ")}
        puts ""
    end

    def win_row?(mark)
        @grid.each { |row| return true if row.all? { |ele| ele == mark} } 
        false
    end

    def win_col?(mark)
        l = @grid.length
        (0...l).each do |i|
            (0...l).each do |j|
                break if @grid[j][i] != mark
                return true if j == l - 1
            end
        end
        false
    end

    def win_diagonal?(mark)
        l = @grid.length

        i, j = 0, 0
        while i < l
            break if @grid[i][j] != mark  
            return true if i == l - 1
            i += 1
            j += 1
        end 

        i, j = 0, l - 1
        while i < l
            break if @grid[i][j] != mark
            return true if i == l - 1
            i += 1
            j -= 1
        end 
        false
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.each { |row| row.each {|ele| return true if ele == "_" }}
        return false 
    end

    def legal_positions
        l, legal = @grid.length, []
        (0...l).each do |i|
            (0...l).each do |j|
                legal << [i, j] if @grid[i][j] == "_"
            end
        end
        legal
    end

end