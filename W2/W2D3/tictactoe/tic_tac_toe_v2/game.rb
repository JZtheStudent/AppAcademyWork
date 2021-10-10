
require_relative "board"
require_relative "human_player"

class Game 

    def initialize(size, *playerMarks)
        @size = size
        @board = Board.new(@size)
        @players = []
        playerMarks.each { |playerMark| @players << HumanPlayer.new(playerMark)}
        @currentPlayerIdx = 0
        @currentPlayer = @players[@currentPlayerIdx]
    end

    def switch_turn
        if @currentPlayerIdx < @size - 1
            @currentPlayerIdx += 1
        else
            @currentPlayerIdx = 0
        end
        @currentPlayer = @players[@currentPlayerIdx]
    end

    def play 
        while @board.empty_positions?
            @board.print
            pos = @currentPlayer.get_position
            @board.place_mark(pos, @currentPlayer.mark)
            if @board.win?(@currentPlayer.mark)
                @board.print
                puts "PLAYER #{@currentPlayer.mark} WINS!"
                return 
            else
                switch_turn 
            end
        end
        puts "THE GAME ENDS WITH A DRAW"
    end

end

game = Game.new(5, :X, :O, :A)
game.play