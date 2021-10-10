require "set"
require "byebug"

def my_uniq(arr)
    arr.to_set.to_a
end

class Array 
    
    def two_sum 
        result = []
        reached = Hash.new
        self.each_with_index do |ele, idx|
            complement = 0 - ele
            if reached.include?(complement)
                result << [reached[complement], idx]
            else
                reached[ele] = idx 
            end
        end 
        result
    end
    
    def my_transpose
        result = Array.new(length) {Array.new(length)}
        (0...length).each do |i|
            (0...length).each do |j|
                result[i][j] = self[j][i]
            end
        end
        result
    end
    
   

    def stock_picker
        result = [0, 1]
        max_profit = -999999999
        (0...length - 1).each do |buy_idx|
            (buy_idx + 1...length).each do |sell_idx|
                cur_profit = self[sell_idx] - self[buy_idx]
                if cur_profit > max_profit 
                    result = [buy_idx, sell_idx]
                    max_profit = cur_profit
                end
            end
        end
        result
    end

end

class TowersOfHanoi
    
    SYMBOLS = {
        "1" => "|    *    |",
        "2" => "|   * *   |",
        "3" => "|  * * *  |",
        "4" => "| * * * * |",
        "5" => "|* * * * *|",
    }
    
    attr_reader :towers
    

    def initialize
        @towers = [["1", "2", "3", "4", "5"], [nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil]]
    end
    
    def render
        (0..4).each do |row|
            temp_str = ""
            towers.each_with_index do |tower, i|
                if tower[row].nil?
                    temp_str << "|         |"
                else
                    temp_str << SYMBOLS[tower[row]]
                end
            end
            puts temp_str
        end
    end
    
    def play
        get_input while !won?
        render
        puts "YAY U DID IT"
    end
    
    def get_input
        system("clear")
        render
        puts "Enter which towers you want to move (0 - 2)...example => '0 1'"
        user_input = gets.chomp
        return if user_input == "quit"
        user_input = user_input.split(" ")
        move(user_input[0].to_i, user_input[1].to_i)
    end
    
    def move(tower_begin, tower_end)
        begin
            if towers[tower_begin].empty?
                raise "Tower is empty!" 
            end
            idx1, idx2 = 0, 0
            idx1 += 1 while towers[tower_begin][idx1].nil?
            if towers[tower_end].all? { |ele| ele.nil? }
                idx2 = 4
            else
                idx2 = 0
                idx2 += 1 while towers[tower_end][idx2 + 1].nil?
            end
       
            towers[tower_end][idx2] = towers[tower_begin][idx1]
            towers[tower_begin][idx1] = nil
            return towers[tower_end]
        rescue
            get_input 
        end
    end
    
    def won?
        @towers[2] == ["1", "2", "3", "4", "5"]
    end

end

# game = TowersOfHanoi.new
# game.play