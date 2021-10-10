require_relative "card.rb"

class Board

    def initialize 
        @grid = Array.new(4){Array.new(4)}
        populate
    end

    def populate
        symbols = ("A".."H").to_a
        symbols.each do |symbol|
            count = 0
            while count < 2
                row, col = rand(0...4), rand(0...4)
                if @grid[row][col].nil?
                    @grid[row][col] = Card.new(symbol)
                    count += 1 
                end
            end  
        end
    end
        
    def [](pos)
        row, col = pos
        @grid[row][col]  
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end 

    def render
        puts "  #{0} #{1} #{2} #{3}"
        (0...4).each do |row|
            str = "#{row} "
            (0...4).each do |col|
                if @grid[row][col].is_revealed 
                    str << "#{@grid[row][col].face_value} "
                else
                    str << "  "
                end
            end
            puts str
        end
    end

    def reveal(guessed_pos)
        self[guessed_pos].reveal
        render 
        return self[guessed_pos]
    end

    def won?
        @grid.each do |row|
            row.each do |card|
                return false if !card.is_revealed
            end
        end
        return true
    end

end