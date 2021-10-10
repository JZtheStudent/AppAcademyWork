require "set"

class ComputerPlayer

    def initialize

        @known_cards = Hash.new { |h, k| h[k] = [] }
        @matched_cards = Set.new
        @known_match = nil 
    end

    def receive_revealed_card(pos, value)
        @known_cards[value] << pos
        if @known_cards[value].length == 2
            @known_match = value
        end
    end 

    def prompt
        puts "Please enter the position of the card you'd like to flip (e.g., '2,3')"
    end

    def get_input(guess_number)
        # p @known_cards
        if @known_match.nil?
            return guess_randomly 
        else 
            if guess_number == 1
                return @known_cards[@known_match][0]
            else
                @matched_cards.add(@known_cards[@known_match][0])
                @matched_cards.add(@known_cards[@known_match][1])
                card = @known_match
                @known_match = nil
                return @known_cards[card][1]
            end
        end
    end

    def guess_randomly
        row, col = rand(0...4), rand(0...4)
        while @matched_cards.include?([row, col]) || @known_cards.any? { |card, arr| arr.include?([row, col])}
            row, col = rand(0...4), rand(0...4)
        end
        return [row, col]
    end
end

# @known_cards = { "H": [[0,0], [1,1]] }
# [0,0] -> "H"
# [1,1] -> "H"
# @known_match = "H"