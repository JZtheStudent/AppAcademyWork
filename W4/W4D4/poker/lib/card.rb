require "set"

class Card 
    

    attr_reader :suit, :number

    def initialize(suit, number)
        # raise "Invalid suit" unless SUITS.include?(suit)
        # raise "Invalid number" unless NUMBERS.inlude?(number)
        @suit = suit
        @number = number 
    end

    def to_s
        "(#{suit}, #{number})"
    end


end
