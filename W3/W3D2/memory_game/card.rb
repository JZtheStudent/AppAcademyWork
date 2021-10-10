
class Card 

    attr_reader :is_revealed, :face_value 

    def initialize(face_value)
        @is_revealed = false 
        @face_value = face_value 
    end

    def hide 
        @is_revealed = false
    end

    def reveal 
        @is_revealed = true
    end

    def to_s 
        @face_value.to_s 
    end

    def ==(other_card)
        self.face_value == other_card.face_value
    end

end

# c = Card.new("A")
# c2 = Card.new("B")
# c == 