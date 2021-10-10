require_relative "card.rb"
require "set"

class Deck
    
    SUITS = Set[ :C, :H, :S, :D ]
    NUMBERS = [ 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A ]
    
    attr_reader :cards
    
    def initialize()
        @cards = []
        populate_deck
    end

    def populate_deck
        SUITS.each do |suit|
            NUMBERS.each do |number|
                cards << Card.new(suit, number)
            end
        end
    end
    
    def shuffle_deck
        @cards.shuffle 
    end

end