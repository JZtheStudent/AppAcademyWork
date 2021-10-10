json.extract! @party, :name, :location

# json.guests do |guest|
#   @party.guests.each do |guest|
#     json.set! guest.id do
#       json.extract! guest, :name
#       json.extract! guest.gifts
#     end
#   end

# end

json.guests @party.guests do |guest|
  json.name guest.name
  json.gifts guest.gifts, :title
end
