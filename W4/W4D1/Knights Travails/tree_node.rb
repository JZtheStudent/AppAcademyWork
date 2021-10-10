class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
   end

    def parent=(node)
        unless parent.nil?
            parent.children.delete(self)
        end
        
        @parent = node
        node.children << self unless node.nil?
    end
    
    def add_child(node)
        node.parent = self
    end

    def remove_child(node)
        self.children.include?(node) ? node.parent = nil : (raise "Child does not exist")
    end

    def dfs(target)
        return self if target == self.value
        self.children.each do |child|
            child_dfs = child.dfs(target)
            return child_dfs unless child_dfs.nil?
        end
        nil
    end

    def bfs(target)
        queue = [self]
        until queue.empty?
            current = queue.pop
            return current if current.value == target
            current.children.each { |child| queue.unshift(child) }
        end

        nil
    end



end

# tree_nodes = ('a'..'g').map { |value| PolyTreeNode.new(value) } 
# our_node = tree_nodes[0]
# our_node.bfs("e")
