
require_relative "board"
require_relative "human_player"
require_relative "computer_player"
require "byebug"

class Game 

    attr_reader :players

    def initialize(size, playerHashes)
        @size = size
        @board = Board.new(@size)
        @players = []
        playerHashes.each do |mark, comp| 
            if comp then @players << ComputerPlayer.new(mark) else @players << HumanPlayer.new(mark)
            end
        end
        @currentPlayerIdx = 0
        @currentPlayer = @players[@currentPlayerIdx]
    end

    def switch_turn
        if @currentPlayerIdx < @players.length - 1
            @currentPlayerIdx += 1
        else
            @currentPlayerIdx = 0
        end
        @currentPlayer = @players[@currentPlayerIdx]
    end

    def play 
        # debugger
        while @board.empty_positions?
            @board.print
            pos = @currentPlayer.get_position(@board.legal_positions)
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

game = Game.new(5, A: false, B: true, C: true)
# p game.players
game.play