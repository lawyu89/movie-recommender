# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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

#Generate Question Objects
q1 = Question.create(title: "Pick an Animal!"
q1_a1 = Answer.create(content: "Lion")
q1_a1
q1_a2 = Answer.create(content: "Dog")
q1_a3 = Answer.create(content: "Dolphin")
q1_a4 = Answer.create(content: "Lion")
