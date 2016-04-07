# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

FactoryGirl.create(:user)
FactoryGirl.create(:user)
FactoryGirl.create(:park, id: 1)
FactoryGirl.create(:park, id: 2)
Review.create([{ rating: 4, body: 'Cool park 1', user_id: 1, park_id: 1}])
Review.create([{ rating: 3, body: 'Cool park 2', user_id: 1, park_id: 2}])
Review.create([{ rating: 2, body: 'Cool park 3', user_id: 2, park_id: 1}])
Review.create([{ rating: 1, body: 'Cool park 4', user_id: 2, park_id: 2}])
