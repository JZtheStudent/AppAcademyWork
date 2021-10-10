require_relative "tree_node.rb"

class KnightPathFinder

    POSSIBLE_MOVES = [
        [1, 2],
        [-1, 2],
        [1, -2],
        [-1, -2],
        [2, 1],
        [2, -1],
        [-2, 1],
        [-2, -2]
    ]

    attr_reader :considered_positions, :start_pos
    attr_accessor :root_node

    def initialize(start)
        @start_pos = start
        @considered_positions = [start]
        build_move_tree
    end

    def self.valid_moves(pos)
        valid_moves_arr = []
        POSSIBLE_MOVES.each do |move|
            new_x = pos[0] + move[0]
            new_y = pos[1] + move[1]

            next unless new_x.between?(0, 7) && new_y.between?(0, 7) # checks to see if coordinate are in valid range of the 8 x 8 grid

            valid_moves_arr << [new_x, new_y]
        end

        valid_moves_arr
    end

    def build_move_tree
        self.root_node = PolyTreeNode.new(start_pos)
        our_queue = [root_node]

        until our_queue.empty?
           current_node = our_queue.shift
           current_node_pos = current_node.value

           new_move_positions(current_node_pos).each do |new_pos|
                new_node = PolyTreeNode.new(new_pos)
                current_node.add_child(new_node)
                our_queue << new_node
           end
        end
    end

    def new_move_positions(pos)
         #takes in a current pos, and then gives new possible moves
         KnightPathFinder.valid_moves(pos)
         .reject { |move| considered_positions.include?(move) }
         .each { |move| considered_positions << move }
    end

    def find_path(ending_pos)
        ending_node = root_node.dfs(ending_pos)

        trace_path_back(ending_node).map(&:value)
    end

    def trace_path_back(ending_node)
        nodes = []

        current_node = ending_node
        until current_node.nil?
            nodes.unshift(current_node)
            current_node = current_node.parent
        end

        nodes
    end
end

kpf = KnightPathFinder.new([0,0])
p kpf.find_path([7, 6])
p kpf.find_path([6, 2])