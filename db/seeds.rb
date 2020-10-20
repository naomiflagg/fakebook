# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Flight.delete_all
flights = []
300.times do
  f = ["#{rand(8)}h#{rand(60)}m", Time.now + rand(0..3600).minutes, Date.today + rand(10..100), rand(8..9), rand(8..9)]
  flights << f unless f[3] == f[4]
end
flights.each do |flight|
  Flight.create(duration: flight[0], time: flight[1], date: flight[2], departure_airport_id: flight[3], arrival_airport_id: flight[4])
end
