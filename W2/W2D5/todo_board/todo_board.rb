require "./list.rb"

class TodoBoard

    def initialize()
        @lists = Hash.new()
    end

    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(" ")

        begin 
            case cmd 
            when "mklist"
                @lists[args[0]] = List.new(args[0])
            when "ls"
                @lists.each { |label, list| puts list.label }
            when "showall"
                @lists.each { |label, list| list.print}
            when "mktodo"
                if args.length == 3
                    label, title, deadline = args
                    @lists[label].add_item(title, deadline)
                elsif args.length == 4
                    label, title, deadline, description = args
                    @lists[label].add_item(title, deadline, description)
                end
            when "up"
                if args.length == 2
                    @lists[args[0]].up(args[1].to_i)
                elsif args.length == 3
                    @lists[args[0]].up(args[1].to_i, args[2].to_i)
                end
            when "down"
                if args.length == 2
                    @lists[args[0]].down(args[1].to_i)
                elsif args.length == 3
                    @lists[args[0]].down(args[1].to_i, args[2].to_i)
                end
            when "swap"
                idx1, idx2 = args[1].to_i, args[2].to_i
                @lists[args[0]].swap(idx1, idx2)
            when "sort"
                @lists[args[0]].sort_by_date!
            when "toggle"
                @lists[args[0]].toggle_item(args[1].to_i)
            when "rm"
                @lists[args[0]].remove_item(args[1].to_i)
            when "purge"
                @lists[args[0]].purge
            when "priority"
                @lists[args[0]].print_priority
            when "print"
                if args.length == 1
                    @lists[args[0]].print
                elsif args.length == 2
                    @lists[args[0]].print_full_item(args[1].to_i)
                end
            when "quit"
                return false
            else 
                print "Sorry, that command is not recognized."
            end
            return true
        rescue 
            print "Sorry, that command is not recognized"
            return true
        end
    end

    def run 
        ask = true
        while ask == true
            ask = get_command 
        end
    end


end

b = TodoBoard.new
b.run