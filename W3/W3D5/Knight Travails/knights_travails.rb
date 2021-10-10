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

    attr_reader :root_node, :move_tree

    def initialize(start)
        @root_node = PolyTreeNode.new(start)
        @move_tree = []
        build_move_tree
    end

    def self.valid_moves(move)
        POSSIBLE_MOVES.each do |move|
        new_x = root_node[0] + move[0]
        new_y = root_node[1] + move[1]

        next unless new_x.between?(0, 7) && new_y.between?(0, 7) # checks to see if coordinate are in valid range of the 8 x 8 grid

         unless root_node.parent.nil?
                next if parent.value = [new_x, new_y] # to check if new potential node is NOT the same as the parent

        end

        new_node = PolyTreeNode.new([new_x, new_y])
        move_tree << new_node
        end
    end

    def build_move_tree
        POSSIBLE_MOVES.each do |move|
            new_x = root_node[0] + move[0]
            new_y = root_node[1] + move[1]

            next unless new_x.between?(0, 7) && new_y.between?(0, 7) # checks to see if coordinate are in valid range of the 8 x 8 grid

            unless root_node.parent.nil?
                next if parent.value = [new_x, new_y] # to check if new potential node is NOT the same as the parent

            end

            new_node = PolyTreeNode.new([new_x, new_y])
            move_tree << new_node
        end
    end

end