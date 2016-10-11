# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Auditorium.all.each do |a|
  a.destroy
end

Movie.all.each do |m|
  m.destroy
end


5.times do |x|
  a = Auditorium.new(name: "Auditorium #{x}", capacity: 60)
  a.save!
end

movies = ["Secret Life of Pets", "Deepwater Horizon", "The Magnificent Seven", "Sully", "Doctor Strange"]

Auditorium.all.each do |auditorium| 
  movies.each do |movie| 
    m = auditorium.movies.create(movie_name: movie, showtime: Faker::Time.between(15.days.from_now, 45.days.from_now), length: rand(90..160))
    m.save
  end
end


