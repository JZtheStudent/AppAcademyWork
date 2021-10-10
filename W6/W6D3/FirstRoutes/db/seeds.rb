# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

artworks = Artwork.create([{title: 'Starry Night', image_url: 'abcde', artist_id: 1}, {title: 'Mona Lisa', image_url: 'sdfansjdnjksf', artist_id: 2}])
users = User.create([{username: 'Van Goh Home'}, {username: 'Leo the TMNT'}, {username: 'Josh'}, {username: 'Andrew'}])
artwork_shares = ArtworkShare.create([{artwork_id: 1, viewer_id: 4}, {artwork_id: 2, viewer_id: 3}])