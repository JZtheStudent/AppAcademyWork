require "byebug"


class Item

    def self.valid_date?(str)
        return false if str.length != 10
        return false if !(str[4] == "-" && str[7] == "-")
        begin 
            year, month, day = str[0..3], str[5..6], str[8..9]
            month = month[1] if month[0] == "0"
            day = day[1] if day[0] == "0"
            if (Integer(year))  && (Integer(month).between?(1, 12))  && (Integer(day).between?(1, 31))
                return true
            else
                return false
            end
        rescue
            return false
        end        
    end

    attr_accessor :title, :deadline, :description, :done

    def initialize(title, deadline, description)
        raise "Deadline is not valid" if !Item.valid_date?(deadline)
        @title = title
        @deadline = deadline
        @description = description 
        @done = false
    end

    def toggle
        if @done then @done = false else @done = true 
        end
    end
end


