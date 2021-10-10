
require_relative "board"
require_relative "human_player"

class Game 

    def initialize(player1_mark, player2_mark)
        @board = Board.new
        @player1 = HumanPlayer.new(player1_mark) 
        @player2 = HumanPlayer.new(player2_mark)
        @currentPlayer = @player1 
    end

    def switch_turn
        if @currentPlayer == @player1
            @currentPlayer = @player2 
        else 
            @currentPlayer = @player1
        end
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

game = Game.new(:X, :O)
game.play