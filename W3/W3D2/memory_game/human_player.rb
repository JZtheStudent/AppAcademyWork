

class HumanPlayer

    def prompt
        puts "Please enter the position of the card you'd like to flip (e.g., '2,3')"
    end

    def get_input(guess_number)
        user_input = gets.chomp.split(",")
        user_input.map(&:to_i)
    end

    def receive_revealed_card(pos, value)
        return nil
    end 


end

# hp = HumanPlayer.new 
# hp.prompt
# hp.get_input