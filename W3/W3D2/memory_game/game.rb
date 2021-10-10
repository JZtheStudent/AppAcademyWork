require_relative "card.rb"
require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game 

    def initialize(player)
        @board = Board.new 
        @current_player = player
    end

    def play
        while !@board.won?
            system("clear")
            @board.render

            @current_player.prompt
            first_guess = @current_player.get_input(1)
            first_guess_value = @board.reveal(first_guess)
            @current_player.receive_revealed_card(first_guess, first_guess_value.face_value)

            @current_player.prompt
            second_guess = @current_player.get_input(2)
            second_guess_value = @board.reveal(second_guess)
            @current_player.receive_revealed_card(second_guess, second_guess_value.face_value)

            if first_guess_value == second_guess_value
                next
            else 
                sleep(2)
                @board[first_guess].hide
                @board[second_guess].hide
            end
        end

    end

end

cp = ComputerPlayer.new
g = Game.new(cp)
g.play