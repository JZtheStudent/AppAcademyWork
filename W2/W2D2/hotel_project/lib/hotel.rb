require_relative "room"

class Hotel
    
    def initialize(name, rooms)
        @name = name
        @rooms = Hash.new
        rooms.each { |roomName, capacity| @rooms[roomName] = Room.new(capacity)}
    end

    def name
        name = @name.split(" ")
        (0...name.length).each { |i| name[i] = name[i].capitalize}
        name.join(" ")
    end

    def rooms
        @rooms 
    end

    def room_exists?(name)
        @rooms.include?(name)
    end

    def check_in(person, roomName)
        if !room_exists?(roomName)
            p "sorry, room does not exist"
        else
            if @rooms[roomName].add_occupant(person)
                # p @rooms
                p "check in successful"
            else
                p "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        @rooms.each { |name, room| return true if room.occupants.empty? }
        return false
    end

    def list_rooms
        @rooms.each { |name, room| puts name + " : " + String(room.available_space) }
    end

end
