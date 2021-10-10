class Player

    def get_move
        pos = []
        puts "enter a position with coordinates separated with a space like '4 7'"
        input = gets.chomp
        pos << input[0].to_i
        pos << input[-1].to_i
        pos
    end

end
