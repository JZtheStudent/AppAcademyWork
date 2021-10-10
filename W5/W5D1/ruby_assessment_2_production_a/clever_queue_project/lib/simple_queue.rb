
class SimpleQueue

    def initialize
        @hidden_array = []
    end

    def size
        hidden_array.size 
    end
    
    def vacant?
        hidden_array.empty?
    end

    def front
        hidden_array.first
    end

    def back
        hidden_array.last
    end

    def first(n)
        begin
            first_arr = []
            idx = 0
            n.times do 
                first_arr << hidden_array[idx]
                idx += 1
            end
            return first_arr
        rescue
            return first_arr
        end 
    end
    
    def last(n)
        begin
            last_arr = []
            idx = n * -1
            n.times do 
                last_arr << hidden_array[idx]
                idx += 1
            end
            return last_arr
        rescue
            return last_arr
        end 
    end
    
    def enqueue(item)
        hidden_array << item 
        size 
    end
    
    def dequeue
        return nil if vacant? 
        hidden_array.shift
    end

    private
    attr_reader :hidden_array

end