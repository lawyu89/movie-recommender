# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'
  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
end

#Generate Genres
action = Genre.create(name: "Action & Adventure")
comdey = Genre.create(name: "Comedy")
scifi = Genre.create(name: "Science Fiction")
horror = Genre.create(name: "Horror")
mystery = Genre.create(name: "Mystery")
romance = Genre.create(name: "Romance")
family = Genre.create(name: "Family")
drama = Genre.create(name: "Drama")
thriller = Genre.create(name: "Thriller")

#Generate 15 Movies for now since the airline is cheap
#assume movie lengths between 1-2 hours, calculated in seconds
15.times do
  movie = Movie.create(name: Faker::Name.name, description: Faker::Lorem.sentence, movie_length: 3600+Random.rand(3600), thumbnail_url: Faker::Avatar.image, rating: rand(10)+rand(11)/10.to_f)
  num_genres = [*2..4].sample #give each movie 2-4 genres
  Genre.all.sample(num_genres).each do |genre|
    movie.genres << genre
  end
end

#Generate 5 Personality Questions with Answers Objects
q1 = Question.create(title: "Pick an Animal!")
q1_a1 = Answer.create(content: "Lion", question_id: q1.id, genre_id: action.id)
q1_a2 = Answer.create(content: "Dove", question_id: q1.id, genre_id: romance.id)
q1_a3 = Answer.create(content: "Dolphin", question_id: q1.id, genre_id: comdey.id)
q1_a4 = Answer.create(content: "ET", question_id: q1.id, genre_id: scifi.id)

q2 =
