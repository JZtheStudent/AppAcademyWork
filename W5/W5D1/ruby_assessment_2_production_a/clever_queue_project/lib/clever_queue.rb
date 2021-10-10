require_relative "simple_queue.rb"

class CleverQueue < SimpleQueue
    
    attr_reader :capacity
    attr_accessor :soft_limit

    def initialize(capacity, soft_limit)
        raise "invalid args" if soft_limit > capacity
        @capacity = capacity 
        @soft_limit = soft_limit
        @hidden_array = []
    end
    
    def enqueue(*args)
        raise "queue is full" if args.length > capacity - size 
        args.each { |arg| hidden_array << arg }
        size
    end
    
    def dequeue(n=1)
        begin 
            dequeue_arr = []
            n.times do 
                dequeue_arr << hidden_array.shift 
            end
            dequeue_arr
        rescue
            until dequeue_arr.length == n
                dequeue_arr << nil 
            end
            dequeue_arr
        end
    end

    def trim
        return false if size < soft_limit
        until size <= soft_limit
            hidden_array.pop
        end
        true
    end

    private
    attr_accessor :hidden_array


end