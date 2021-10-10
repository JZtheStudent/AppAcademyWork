class Board
  
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N)}
        @size = n * n 
    end

    def size
        @size 
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val 
    end

    def num_ships
        count, l = 0, @grid.length
        (0...l).each do |i|
            (0...l).each do |j|
                count += 1 if @grid[i][j] == :S
            end
        end
        count
    end

    def attack(pos)
        if self[pos] == :S 
            self[pos] = :H 
            puts "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        numToPlace, l = @size / 4, @grid.length
        while numToPlace > 0
            i, j = rand(0...l), rand(0...l)
            if @grid[i][j] != :S 
                @grid[i][j] = :S 
                numToPlace -= 1
            end
        end
    end

    def hidden_ships_grid
        @grid.map do |row| 
            row.map do |ele| 
                if ele == :S
                    ele = :N
                else
                    ele = ele
                end
            end
        end
    end

    def self.print_grid(grid)
        grid.each { |row| puts row.join(" ")}
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print 
        Board.print_grid(hidden_ships_grid)
    end

end
