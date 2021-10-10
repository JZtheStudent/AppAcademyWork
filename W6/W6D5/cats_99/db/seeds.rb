# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#cats
Cat.create(name: "Chairis",color: "black",sex: "F", description: "Very Cool",birth_date: "2015/05/15")
Cat.create(name: "Diego",color: "white",sex: "M", description: "Very Cool2",birth_date: "2018/03/12")


#cat rental requests
CatRentalRequest.create(cat_id: 1, start_date: "2016/05/15", end_date: "2016/06/15", status: "APPROVED")
CatRentalRequest.create(cat_id: 2, start_date: "2018/05/15", end_date: "2018/06/15", status: "APPROVED")