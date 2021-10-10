json.extract! @guest, :name, :age, :favorite_color
json.gifts do |gift|
  json.array! @guest.gifts, :title, :description
end