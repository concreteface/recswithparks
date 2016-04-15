# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
human = Species.create(name: "human", thumbnail: "/assets/human.png")
duck = Species.create(name: "duck", thumbnail: "/assets/duck.png")
dog = Species.create(name: "dog", thumbnail: "/assets/dog.png")
Species.create(name: "cat", thumbnail: "/assets/cat.png")
Species.create(name: "bird", thumbnail: "/assets/bird.png")
Species.create(name: "halcyon", thumbnail: "/assets/halcyon.png")
Species.create(name: "other", thumbnail: "/assets/yeti.gif")
user1 = User.new(email: "recswithparks1@mailinator.com", password: "password", admin: true, species: duck)
user2 = User.new(email: "recswithparks2@mailinator.com", password: "password", admin: false, species: human)
user3 = User.new(email: "recswithparks3@mailinator.com", password: "password", admin: false, species: dog)
user1.add_avatar(Rails.root + "app/assets/images/cena.jpg")
user1.save
user2.add_avatar(Rails.root + "app/assets/images/rogers.jpg")
user2.save
park1 = Park.create(name: "Boston Public Garden", street: "Beacon Street, Boston", description: " \
  The Public Garden was the first public botanical garden in America. \
  It was decorative and flowery from its inception, featuring meandering pathways for strolling.", user: user1)
park2 = Park.create(name: "Zilker Park", street: "Barton Springs Road, Austin", description: " \
  Zilker Park sits just across Lady Bird Lake from Austin's skyline and visitors \
  enjoy land dedicated to running, jogging, biking, and many other outdoor activities.", user: user2)
park3 = Park.create(name: "Zion National Park", street: "Utah", description: " \
  Gaze up at massive sandstone cliffs of cream, pink, and red that soar into a brilliant blue sky.", user: user2)
Park.create(name: "Whip Hill Park", street: "Whip Hill Road, Stoneham", user: user1)
Review.create([{ rating: 4, body: "My daughter loved to ride on the swanboats", user: user1, park: park1 },
  { rating: 3, body: "Everytime we visit Boston we make sure to visit this park", user: user2, park: park1 },
  { rating: 1, body: "The park was too crowded.", user: user3, park: park1 },
  { rating: 5, body: "This is great place to see good acts for free.", user: user1, park: park2 },
  { rating: 1, body: "Too many concerts... I like peace and quiet", user: user2, park: park2 },
  { rating: 5, body: "This park is wonderul but leave yourself more time than you think. So much to see.", user: user3, park: park3 },
  { rating: 5, body: "This park was on my bucketlist and did not disappoint.", user: user2, park: park3 }
])
