# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def create_user
  User.create!(email: Faker::Internet.email, password: "foobar", username: Faker::Name.name)
end

def create_film
	Film.create(title: Faker::Superhero.name, description: Faker::StarWars.quote, picture: Faker::Placeholdit.image("50x50"))
end

def create_review
	Review.create(review_title: Faker::Hipster.word ,review_content: Faker::StarWars.quote, user_id: rand(1..10), film_id: rand(1..10), recommend:[true, false].sample)
end

def create_comment
	Comment.create(comment_body: Faker::StarWars.quote, user_id: rand(1..10), commentable_id: rand(1..10), commentable_type: ["Film", "Review"].sample )
end

def create_category
	Category.create(name: "Horror")
	Category.create(name: "Comedy")
	Category.create(name: "Drama")
	Category.create(name: "Total Shit")
	Category.create(name: "New Releases")
end

10.times {create_user}
10.times {create_film}
10.times {create_review}
10.times {create_comment}
create_category