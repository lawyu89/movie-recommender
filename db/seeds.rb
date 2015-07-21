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

#Generate Flight Data (assume travel time is currently 1 to 7 hours)
location = ['SFO', 'JFK', 'LAX', 'BOS', 'LAS', 'PIT', 'TPL', 'SDF']
10.times do
  path_name = location.sample(2)
  Flight.create(path_name: path_name.join(' - '), travel_time: 3600+Random.rand(15000))
end


#Generate 7 type of genres that are currently available
action = Genre.create(name: "Action & Adventure")
comedy = Genre.create(name: "Comedy")
scifi = Genre.create(name: "Science Fiction")
horror = Genre.create(name: "Horror")
mystery = Genre.create(name: "Mystery")
romance = Genre.create(name: "Romance")
family = Genre.create(name: "Family")

#Generate 20 Movies for now since the airline is cheap
#assume movie lengths between 1-2 hours, calculated in seconds
20.times do
  movie = Movie.create(name: Faker::Name.name, description: Faker::Lorem.sentence, movie_length: 3600+Random.rand(3600), thumbnail_url: Faker::Avatar.image, rating: rand(10)+rand(11)/10.to_f, released_year: [*1980..2015].sample)
  num_genres = [*2..4].sample #give each movie 2-4 genres
  Genre.all.sample(num_genres).each do |genre|
    movie.genres << genre
  end
end

#Generate 5 Personality Questions with Answers Objects
q1 = Question.create(title: "Select an Animal!")
Answer.create(content: "Lion", question_id: q1.id, genre_id: action.id)
Answer.create(content: "Dove", question_id: q1.id, genre_id: romance.id)
Answer.create(content: "Dolphin", question_id: q1.id, genre_id: comedy.id)
Answer.create(content: "T-rex", question_id: q1.id, genre_id: scifi.id)
Answer.create(content: "Jellyfish", question_id: q1.id, genre_id: mystery.id)
Answer.create(content: "Dog", question_id: q1.id, genre_id: family.id)
Answer.create(content: "Zombie Cat", question_id: q1.id, genre_id: horror.id)

q2 = Question.create(title: "Which location do you want to go to next?")
Answer.create(content: "Paris", question_id: q2.id, genre_id: romance.id)
Answer.create(content: "Hawaii", question_id: q2.id, genre_id: comedy.id)
Answer.create(content: "Mount Everest", question_id: q2.id, genre_id: action.id)
Answer.create(content: "Stonehenge", question_id: q2.id, genre_id: mystery.id)
Answer.create(content: "Disney World", question_id: q2.id, genre_id: family.id)
Answer.create(content: "Transylvania", question_id: q2.id, genre_id: horror.id)
Answer.create(content: "Mars", question_id: q2.id, genre_id: scifi.id)

q3 = Question.create(title: "Pick a food item!")
Answer.create(content: "Hot Dog", question_id: q3.id, genre_id: family.id)
Answer.create(content: "Brownies", question_id: q3.id, genre_id: mystery.id)
Answer.create(content: "Chocolate", question_id: q3.id, genre_id: romance.id)
Answer.create(content: "Steamed Frogs", question_id: q3.id, genre_id: scifi.id)
Answer.create(content: "Corn Candy", question_id: q3.id, genre_id: horror.id)
Answer.create(content: "Lollipop", question_id: q3.id, genre_id: comedy.id)
Answer.create(content: "Pop rocks", question_id: q3.id, genre_id: action.id)

q4 = Question.create(title: "Choose a Color!")
Answer.create(content: "White", question_id: q4.id, genre_id: family.id)
Answer.create(content: "Pink", question_id: q4.id, genre_id: romance.id)
Answer.create(content: "Grey", question_id: q4.id, genre_id: mystery.id)
Answer.create(content: "Yellow", question_id: q4.id, genre_id: comedy.id)
Answer.create(content: "Green", question_id: q4.id, genre_id: scifi.id)
Answer.create(content: "Black", question_id: q4.id, genre_id: horror.id)
Answer.create(content: "Orange", question_id: q4.id, genre_id: action.id)

q5 = Question.create(title: "If you were a superhero, who would you be?")
Answer.create(content: "Batman", question_id: q5.id, genre_id: mystery.id)
Answer.create(content: "Blade", question_id: q5.id, genre_id: horror.id)
Answer.create(content: "Superman", question_id: q5.id, genre_id: romance.id)
Answer.create(content: "Captain America", question_id: q5.id, genre_id: family.id)
Answer.create(content: "Thor", question_id: q5.id, genre_id: action.id)
Answer.create(content: "Martian Manhunter", question_id: q5.id, genre_id: scifi.id)
Answer.create(content: "Spider Man", question_id: q5.id, genre_id: comedy.id)

q6 = Question.create(title: "What would you order at a resturant?")
Answer.create(content: "Grey", question_id: q6.id, genre_id: mystery.id)
Answer.create(content: "Deviled Eggs", question_id: q6.id, genre_id: horror.id)
Answer.create(content: "Pie", question_id: q6.id, genre_id: comedy.id)
Answer.create(content: "Livers and Onions", question_id: q6.id, genre_id: scifi.id)
Answer.create(content: "Steak", question_id: q6.id, genre_id: action.id)
Answer.create(content: "Spagetti and Meatballs", question_id: q6.id, genre_id: romance.id)
Answer.create(content: "Roasted Turkey", question_id: q6.id, genre_id: family.id)

q7 = Question.create(title: "You're at a toy store, what do you get?")
Answer.create(content: "Light Saber!!!", question_id: q7.id, genre_id: scifi.id)
Answer.create(content: "Fake Tarantula", question_id: q7.id, genre_id: horror.id)
Answer.create(content: "Rubik's Cube", question_id: q7.id, genre_id: mystery.id)
Answer.create(content: "Twister", question_id: q7.id, genre_id: family.id)
Answer.create(content: "Toy Sword", question_id: q7.id, genre_id: action.id)
Answer.create(content: "Rubber Chicken", question_id: q7.id, genre_id: comedy.id)
Answer.create(content: "Teddy Bear", question_id: q7.id, genre_id: romance.id)

q8 = Question.create(title: "Tree?")
Answer.create(content: "Silk Cotton Tree", question_id: q8.id, genre_id: mystery.id)
Answer.create(content: "Willow Tree", question_id: q8.id, genre_id: romance.id)
Answer.create(content: "Burmis Tree", question_id: q8.id, genre_id: horror.id)
Answer.create(content: "Baobab Tree", question_id: q8.id, genre_id: action.id)
Answer.create(content: "Dracaena Tree", question_id: q8.id, genre_id: scifi.id)
Answer.create(content: "Palm Tree", question_id: q8.id, genre_id: comedy.id)
Answer.create(content: "Redwood Tree", question_id: q8.id, genre_id: family.id)