# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
FactoryGirl.create(:user, email: 'admin@test.com', password: 'password', admin: true)
user1 = FactoryGirl.create(:user)
user2 = FactoryGirl.create(:user)
park1 = FactoryGirl.create(:park)
park2 = FactoryGirl.create(:park)
Review.create([{ rating: 4, body: 'Cool park 1', user: user1, park: park1 }])
Review.create([{ rating: 3, body: 'Cool park 2', user: user1, park: park2 }])
Review.create([{ rating: 2, body: 'Cool park 3', user: user2, park: park1 }])
Review.create([{ rating: 1, body: 'Cool park 4', user: user2, park: park2 }])
Species.create( [{ name: "human", thumbnail: "/assets/human.png" }] )
Species.create( [{ name: "duck", thumbnail: "/assets/duck.png" }] )
Species.create( [{ name: "dog", thumbnail: "/assets/dog.png" }] )
Species.create( [{ name: "cat", thumbnail: "/assets/cat.png" }] )
Species.create( [{ name: "bird", thumbnail: "/assets/bird.png" }] )
Species.create( [{ name: "halcyon", thumbnail: "/assets/halcyon.png" }] )
Species.create( [{ name: "other", thumbnail: "/assets/yeti.gif" }] )
