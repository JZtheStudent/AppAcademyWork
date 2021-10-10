require "./item.rb"

require "byebug"

class List

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        return false if !Item.valid_date?(deadline)
        @items << Item.new(title, deadline, description)
        true
    end

    def size
        @items.length
    end

    def valid_index?(idx)
        return false if size == 0
        (0...size).include?(idx)
    end

    def swap(idx1, idx2)
        return false if !valid_index?(idx1) || !valid_index?(idx2)
        @items[idx1], @items[idx2] = @items[idx2], @items[idx1]
        return true
    end

    def [](idx)
        return nil if !valid_index?(idx)
        @items[idx]
    end

    def priority
        nil if @items.empty?
        @items.min_by { |item| item.deadline }
    end

    def print
        line_length = 50
        puts "-" * line_length
        puts " " * ((line_length - label.length) / 2) + label.upcase
        puts "-" * line_length
        puts "Index | Item" + " " * 15 + "| Deadline" + "   | Done"
        puts "-" * line_length
        (0...@items.length).each do |i|
            item = @items[i]
            if item.done then doneSign = "X" else doneSign = " "
            end 
            puts String(i) + " " * 5 + "| "  + item.title + " " * (line_length - (31 + item.title.length)) + "| " + item.deadline + " | [" + doneSign + "]"
        end
        puts "-" * line_length
    end

    def print_full_item(idx)
        if valid_index?(idx)
            item, line_length = @items[idx], 50
            if item.done then doneSign = "X" else doneSign = " "
            end 
            puts "-" * line_length
            puts item.title + " " * (line_length - item.title.length - 20) + item.deadline + " " * 4 + "[" + doneSign + "]"
            puts item.description 
            puts "-" * line_length
        end
    end

    def print_priority
        if priority != nil 
            idx = @items.index(priority)
            print_full_item(idx)
        end
    end

    def up(idx, amt=1)
        return false if !valid_index?(idx)
        amt = idx if amt > idx 
        while amt > 0
            swap(idx, idx - 1)
            idx -= 1
            amt -= 1
        end
        return true 
    end

    def down(idx, amt=1)
        return false if !valid_index?(idx)
        amt = (size - 1 - idx) if amt > (size - 1 - idx)
        while amt > 0
            swap(idx, idx + 1)
            idx += 1
            amt -= 1
        end
        return true
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end

    def toggle_item(idx)
        return false if !valid_index?(idx)
        @items[idx].toggle
        return true
    end

    def remove_item(idx)
        return false if !valid_index?(idx)
        @items = @items.select { |item| item if item!= @items[idx]}
        return true
    end

    def purge
        @items = @items.select { |item| item if item.done == false}
    end

end


